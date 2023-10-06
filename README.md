# Laboratorio II

Implementación de un sumador/restador de 4 bits en Verilog.

El restador se implementara de tal manera que reciba dos entradas de 4 bits cada una, en la que cada entrada representa un valor en magnitud y cuya salida sera la diferencia en magnitud de las dos entradas.

En principio y con la idea/meta de reutilizar componentes ya implementados, se construyeron los siguientes módulos:

## Diseño e Implementación de un medio sumador 

Un circuito medio sumador es un circuito lógico que realiza la suma de dos entradas de un bit y devuelve el resultado en 
dos salidas, un bit de suma y un bit de acarreo.  

### Tabla de verdad 

Para implementar un medio sumador, se utilizó la siguiente tabla de verdad:

| Entradas      |               | Salidas      |              |
|---------------|---------------|--------------|--------------|
| **Input (A)** | **Input (B)** | **COut (C)** | **Suma (S)** |
| 0             | 0             | 0            | 0            |
| 0             | 1             | 0            | 1            |
| 1             | 0             | 0            | 1            |
| 1             | 1             | 1            | 0            |

Se observa, que para la salida de suma, la tabla de verdad da como resultado una disyunción exclusiva y para la salida 
acarreo una conjunción como función lógica. 

Desde Digital podemos construir el medio sumador (semisumador) a partir la tabla de verdad, desde la sección, "Análisis" 
y luego en "Sintetizar".

![Sintetizar Digital](images/digital_sintetizar.png)

Luego, ajustamos las entradas como A y B y las salidas como Cout y Suma, tal como se visualiza en la siguiente imagen:

![Tabla de verdad semisumador](images/digital_ss_tv.png)

### Mapa de Karnaugh

Para determinar la mínima expresión de la función lógica de las salidas acarreo y suma se realiza el mapa de Karnaugh, 
dando como resultado los siguientes mapas de Karnaugh:

**Mapa Karnaugh Suma:**

![Mapa Karnaugh Suma](images/digital_ss_mapa_suma.png)

**Mapa Karnaugh Cout:**

![Mapa Karnaugh Cout](images/digital_ss_mapa_cout.png)

En Digital, desde la tabla de verdad, en la barra superior, aparece la opción para generar los mapas de Karnaugh de las 
salidas desde la opción "Mapa de Karnaugh" o dando clic "F1".

![Mapa de Karnaugh Digital](images/digital_mapa_Karnaugh.png)

### Ecuaciones lógicas

Al observar los mapas de Karnaugh de Cout y suma podemos determinar las ecuaciones lógicas de las salidas:

```
Suma = !A*B + A*!B = A ⊕ B
```
```
Cout = A*B
```

Teniendo las ecuaciones lógicas, podemos determinar el circuito equivalente.

### Esquema de conexiones (RTL)

Como la suma es el resultado de una disyunción exclusiva entre las entradas, la puerta equivalente es un XOR y para el 
Cout o carrier de salida se obtiene a partir de una conjunción de las entradas, la puerta equivalente es un AND. 

Cada puerta lógica es de dos entradas (A, B) y una salida.

![RTL Semisumador](images/digital_ss_RTL.png) 

Por último, en digital guardamos el semisumador en un archivo .dig en la misma carpeta donde se creará el sumador.

## Implementación de un sumador completo

Un sumador completo es un circuito lógico que realiza la suma de dos entradas y un acarreo de entrada, cada una de un 
bit, generando dos salidas, una salida de suma y otra de acarreo.

Las entradas representan los dos bits a sumar y el acarreo de entrada y las salidas representan el resultado de la suma 
y el acarreo de salida.

### Tabla de verdad

Para implementar un sumador completo, se utilizó la siguiente tabla de verdad:

| **Input (A)** | **Input (B)** | **CIn (Ci)** | **COut (Co)** | **Suma (S)**  |
|---------------|---------------|--------------|---------------|---------------|
| 0             | 0             | 0            | 0             | 0             |
| 0             | 0             | 1            | 0             | 1             |
| 0             | 1             | 0            | 0             | 1             |
| 0             | 1             | 1            | 1             | 0             |
| 1             | 0             | 0            | 0             | 1             |
| 1             | 0             | 1            | 1             | 0             |
| 1             | 1             | 0            | 1             | 0             |
| 1             | 1             | 1            | 1             | 1             |

### Mapa de Karnaugh

Desde Digital podemos generar el mapa de Karnaugh a partir de la tabla de verdad:

Mapa Karnaugh Cout:

![Mapa Karnaugh Cout](images/digital_s_mapa_cout.png)

Mapa Karnaugh Suma:

![Mapa Karnaugh Suma](/images/digital_s_mapa_suma.png)

### Ecuaciones lógicas

Las siguientes ecuaciones lógicas:

```
Suma = !A*!B*CIn + !A*B*!CIn+ A*!B*!CIn + A*B*CIn

Suma = A ⊕ (B ⊕ CIn)
```

```
COut = !A*B*CIn + A*!B*CIn + A*B*!CIn + A*B*CIn

COut = CIn * (A ⊕ B) + A*B
```

### Esquema de conexiones (RTL)

De acuerdo a las ecuaciones lógicas que relacionan las entradas con cada una de las salidas, se realiza el esquema de 
conexiones del sumador, en este caso se requieren dos puertas AND, dos puertas XOR y una puerta OR, como se visualiza 
en el siguiente esquema realizado en Digital.

![RTL Sumador](images/digital_s_RTL.png)

Teniendo en cuenta que el sumador se construye a partir de dos semisumadores y una puerta OR, se genera el encapsulado 
del semisumador, de esta manera se establece el RTL de manera compacta.

Como se puede visualizar en el esquemático generado en Digital.

![RTL Sumador encapsulado](images/digital_s_RTL_encapsulado.png)

## Sumador de 4 bits

Con el encapsulado del sumador, podemos generar el sumador de 4 bits, con 4 sumadores de un bit, donde el sumador S0, 
que suma los bits menos significativos tiene como entradas A0, B0 y Cin se conecta a GND, luego el sumador S1 se conecta 
a la entrada A1, B1 y Cin se conecta al carrier Cout del sumador S0; para el sumador S2, se conecta a las entradas A2, 
B2 y Cin se conecta al carrier Cout del sumador S; por último, el sumador más significativo S3 se conecta a A3, B3 y Cin 
se conecta a una salida Carrier, como se visualiza en el esquemático de Digital.

![](images/digital_4bits_nibble.png)

## Restador

Para el restador de 4 bits, debemos definir el minuendo y el sustraendo en el circuito, en este caso, se establece que la entrada A corresponde al minuendo y la entrada B al sustraendo, de esta manera para utilizar el sumador de 4 bits en la implementacón del restador, primero debemos realizar sobre la entrada B el complemento a 1, luego para generar el complemento a 2 en B se le suma 1 al bit menos significativo. Teniendo la entrada A y el complemento a 2 de B, realizamos la operación de suma desde el sumador de 4 bits, y de esta manera tendremos la diferencia o resto. 

Si el acarreo del sumador del bit más significativo es 1, el resultado no esta en complemento, pero si por el contrario el acarreo esta en 0, el resultado de 4 bits se encuentra en complemento a 2 al ser un valor negativo.

## Implementación de complemento a 1

Para generar el complemento a 2 del sustraendo (B), debemos tener un circuito inversor que realzará el proceso de complemento a 1 sobre B, por lo tanto se utilizan 4 inversores que negaran cada bit de entrada.

![](images/Inversor.png)

## Implementación de complemento a 2

Teniendo el circuto inversor que genera el complemento a 1, podemos efectuar de el complemento a 2 de B con 4 semisumadores en cascada, donde se asignará a una de las entradas el valor de 1, en el semisumador menos significativo, donde cada acarreo Cout de los semisumadores se conectará a una de las entradas del semisumador más significativo, excepto el acarreo del semisumador más significativo, el cual no se conectará.

![](images/semisumador_nibble.png)

Teniendo el semisumador de 4 bits, conectamos las salidas del inversor con las entradas del semisumador.

![](images/COMPLEMENTO_A_2.png)

## Implementación de del restador

Ahora conectamos las entrada B al encapsulado complemento a 2 y las salidas del complemento a 2 de B junto con las entradas de A se concectarán al sumador de 4 bits, generando una salida de 4 bits y un acarreo Cout que nos ayudará a determinar su la salida esta en complemento a 2 o no. 
![](images/restador.png)

Si el acarreo de salida del sumador de 4 bits (Cout) es 1, la salida del sumador S es una palabra no complementada, y por el contrario, si Cout es 0, S se encuentra en complemento a 2. Por eso, para entregar una salida no complementada para cualquier resultado, se debe ajustar la salida cuando Cout sea 0, generando nuevamente el complemento a 2 en la salida del sumador de 4 bits, de esta manera se entregará la diferencia entre A y B de manera explicita.


Para poder determinar si la se entrega desde el sumador de 4 bits, o debe pasar primero por el complemento a 2, es neserario un multiplexor 9-4, donde se conectaran desde las entradas la salida S del sumador de 4 bits y la salida del complemento a 2 que tiene como entradas la salida S del sumador de 4 bits, adiconlmente la entrada Cin del multiplexor 9-4 se conecta con el acarreo de salda del sumador, la cual será la señal de control, si Cin es 1, la salida C del multiplexor 9-4 conmutará con la entrada A, pero si Cin es 0, la salda C conmutara con la entrada B que es la salida en complemento a 2 del sumador.

![](images/Multiplexor_9-4.png)

Este proceso presenta una restricción, cuando la entrada B es 0000 sin importar el valor de A, el acarreo de salida del sumador de 4 bits es 0, pero realmente debe ser 1, indicando que la salida S es no complementada, por eso, para corregir esta respuesta incorrecta, primero se utilizará un multiplexor 8-4, que se conectará con las entradas A y B, donde B, dentro del multiplexor estará conectado a una puerta NOR, cuya salida de la puerta NOR actuará como señal de control; en este caso, si B es 0000, la salida del multiplexor conmutará con la entrada A, de lo contrario, no conmutará y su salida sera 0000.

![](images/Multiplexor_8-4.png)

Por último, se utilizará un multiplexor 9-4 que tendrá como entradas, las salidas de los multiplexores 9-4 y 8-4, y su señal de control sera la salida de una puerta NOR que tendrá como entrada la señal B, en este caso si la señal de control será 1 cuando B sea 0000, permitiendo que la salida S conmutará con el multiplexor 8-4, de lo contrario conmutará con la salida delmultiplexor 9-4, corrigiendo así la restricción del acarreo de salida del sumador de 4 bits.

![](images/Restador_Final.png)


## Implementación de complemento a 2

### Tabla de verdad

Para implementar el complemento a 2, se utilizó la siguiente tabla de verdad:

| **Input (A0)** | **Input (A1)** | **Input (A2)** | **Input (A3)** | **Output (S0)** | **Output (S1)** | **Output (S2)** | **Output (S3)** | **Output (Co)** |
|----------------|----------------|----------------|----------------|-----------------|-----------------|-----------------|-----------------|-----------------|
| 0              | 0              | 0              | 0              | 0               | 0               | 0               | 0               | 1               |
| 0              | 0              | 0              | 1              | 0               | 0               | 0               | 1               | 0               |
| 0              | 0              | 1              | 0              | 0               | 0               | 1               | 1               | 0               |
| 0              | 0              | 1              | 1              | 0               | 0               | 1               | 0               | 0               |
| 0              | 1              | 0              | 0              | 0               | 1               | 1               | 1               | 0               |
| 0              | 1              | 0              | 1              | 0               | 1               | 1               | 0               | 0               |
| 0              | 1              | 1              | 0              | 0               | 1               | 0               | 1               | 0               |
| 0              | 1              | 1              | 1              | 0               | 1               | 0               | 0               | 0               |
| 1              | 0              | 0              | 0              | 1               | 1               | 1               | 1               | 0               |
| 1              | 0              | 0              | 1              | 1               | 1               | 1               | 0               | 0               |
| 1              | 0              | 1              | 0              | 1               | 1               | 0               | 1               | 0               |
| 1              | 0              | 1              | 1              | 1               | 1               | 0               | 0               | 0               |
| 1              | 1              | 0              | 0              | 1               | 0               | 1               | 1               | 0               |
| 1              | 1              | 0              | 1              | 1               | 0               | 1               | 0               | 0               |
| 1              | 1              | 1              | 0              | 1               | 0               | 0               | 1               | 0               |
| 1              | 1              | 1              | 1              | 1               | 0               | 0               | 0               | 0               |

### Mapa de Karnaugh

Dando como resultado los siguientes mapas de Karnaugh:

**Mapa Karnaugh S0:**

![Mapa Karnaugh S0](images/digital_c2_mapa_s0.png)

**Mapa Karnaugh S1:**

![Mapa Karnaugh S1](images/digital_c2_mapa_s1.png)

**Mapa Karnaugh S2:**

![Mapa Karnaugh S2](images/digital_c2_mapa_s2.png)

**Mapa Karnaugh S3:**

![Mapa Karnaugh S3](images/digital_c2_mapa_s3.png)

**Mapa Karnaugh Co:**

![Mapa Karnaugh Co](images/digital_c2_mapa_co.png)

### Ecuaciones lógicas

Y las siguientes ecuaciones lógicas:


## Implementación de un sumador/restador de 4 bits

Un sumador/restador de 4 bits es un circuito lógico que realiza la suma o resta de dos números binarios de 4 bits y 
devuelve el resultado en cuatro salidas.

El circuito tiene nueve entradas y cuatro salidas.

Las entradas representan los cuatro bits del primer número, los cuatro bits del segundo número y el bit de control

Las salidas representan los cuatro bits del resultado.

### Tabla de verdad

Para implementar el sumador/restador de 4 bits, se utilizó la siguiente tabla de verdad:

| **Input (A)** | **Input (B)** | **Input (C)** | **Input (D)** | **Input (E)** | **Input (F)** | **Input (G)** | **Input (H)** | **Input (I)** | **Output (A)** | **Output (B)** | **Output (C)** | **Output (D)** |
|---------------|---------------|---------------|---------------|---------------|---------------|---------------|---------------|---------------|----------------|----------------|----------------|----------------|
