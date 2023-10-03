# Laboratorio II

Implementación de un sumador/restador de 4 bits en Verilog.

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

Con el encapsulado de del sumador, podemos generar el sumador de 4 bits, con 4 sumadores de un bit, donde el sumador S0, 
que suma los bits menos significativos tiene como entradas A0, B0 y Cin se conecta a GND, luego el sumador S1 se conecta 
a la entrada A1, B1 y Cin se conecta al carrier Cout del sumador S0; para el sumador S2, se conecta a las entradas A2, 
B2 y Cin se conecta al carrier Cout del sumador S; por último, el sumador más significativo S3 se conecta a A3, B3 y Cin 
se conecta a una salida Carrier, como se visualiza en el esquemático de Digital.

![](images/digital_4bits_nibble.png)

## Implementación de complemento a 2

Un complemento a 2 es un circuito lógico que realiza la operación de complemento a 2 de un número binario de 4 bits.

El circuito tiene cuatro entradas y cuatro salidas.

Las entradas representan los cuatro bits del número binario y las salidas representan los cuatro bits del complemento 
a 2.

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
