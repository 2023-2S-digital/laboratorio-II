# Laboratorio II

Implementación de un sumador/restador de 4 bits en Verilog.

En principio y con la idea/meta de reutilizar componentes ya implementados, se construyeron los siguientes módulos:

## Diseño e Implementación de un medio sumador

Un circuito medio sumador es un circuito lógico que realiza la suma de dos entredas de un bit y devuelve el resultado en dos salidas, un bit de suma y un bit de acarreo.  

### Tabla de verdad

Para implementar un medio sumador, se utilizó la siguiente tabla de verdad:

| Entradas      |               | Salidas      |              |
|---------------|---------------|--------------|--------------|
| **Input (A)** | **Input (B)** | **Cout (C)** | **Suma (S)** |
| 0             | 0             | 0            | 0            |
| 0             | 1             | 0            | 1            |
| 1             | 0             | 0            | 1            |
| 1             | 1             | 1            | 0            |

Donde se observa, que para la la salida de suma, la tabla de verdad da como resultado una una disyunción exclusiva y para la salida acarreo, se observa una conjunción como función lógica. 

### Mapa de Karnaugh
Para determinar la mínima expresión de la función lógica de las salidas acarreo y suma se realiza el mapa de karnaugh, dando como resultado los siguientes mapas de Karnaugh:

Mapa Karnaugh Suma:

![Mapa Karnaugh Suma](https://github.com/2023-2S-digital/laboratorio-II/blob/main/imagenes/Mapa%20K%20Suma.png)

Mapa Karnaugh Cout: 

![Mapa Karnaugh Cout](https://github.com/2023-2S-digital/laboratorio-II/blob/main/imagenes/Mapa%20K%20Cout.png)

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

Como la suma es el resultado de una disyunción exclusiva entre las entradas, la puerta equivalente es un XOR y para el Cout o carrier de salida se obtiene a partir de una conjuncion de las entradas, la puerta equivalente es un AND. Cada puerta lógica es de dos entradas (A, B) y una salida.

![RTL Semisumador](https://github.com/2023-2S-digital/laboratorio-II/blob/main/imagenes/RTL_semisumador.png)



## Implementación de un sumador completo

Un sumador completo es un circuito lógico que realiza la suma de dos bits y un acarreo de entrada y devuelve el 
resultado en dos salidas.

El circuito tiene tres entradas y dos salidas.

Las entradas representan los dos bits a sumar y el acarreo de entrada y las salidas representan el resultado de la suma 
y el acarreo de salida.

### Tabla de verdad

Para implementar un sumador completo, se utilizó la siguiente tabla de verdad:

| **Input (A)** | **Input (B)** | **Cin (Ci)** | **Suma (S)** | **Cout (Co)** |
|---------------|---------------|--------------|--------------|---------------|
| 0             | 0             | 0            | 0            | 0             |
| 0             | 0             | 1            | 1            | 0             |
| 0             | 1             | 0            | 1            | 0             |
| 0             | 1             | 1            | 0            | 1             |
| 1             | 0             | 0            | 1            | 0             |
| 1             | 0             | 1            | 0            | 1             |
| 1             | 1             | 0            | 0            | 1             |
| 1             | 1             | 1            | 1            | 1             |

### Mapa de Karnaugh

Dando como resultado el siguiente mapa de Karnaugh:

### Ecuaciones lógicas

Y las siguientes ecuaciones lógicas:

```
S = !A.!B.Ci + !A.B.!Ci + A.!B.!Ci + A.B.Ci

S = A ⊕ (B ⊕ Ci)
```

```
Co = !A.B.Ci + A.!B.Ci + A.B.!Ci + A.B.Ci

Co = Ci.(A ⊕ B) + A.B
```

### Esquema de conexiones (RTL)

Y el siguiente esquema de conexiones:

## Implementación de complemento a 2

Un complemento a 2 es un circuito lógico que realiza la operación de complemento a 2 de un número binario de 4 bits.

El circuito tiene cuatro entradas y cuatro salidas.

Las entradas representan los cuatro bits del número binario y las salidas representan los cuatro bits del complemento a 2.

### Tabla de verdad

Para implementar el complemento a 2, se utilizó la siguiente tabla de verdad:

| **Input (A)** | **Input (B)** | **Input (C)** | **Input (D)** | **Output (A)** | **Output (B)** | **Output (C)** | **Output (D)** |
|---------------|---------------|---------------|---------------|----------------|----------------|----------------|----------------|
| 0             | 0             | 0             | 0             | 0              | 0              | 0              | 0              |
| 0             | 0             | 0             | 1             | 1              | 1              | 1              | 1              |
| 0             | 0             | 1             | 0             | 1              | 1              | 1              | 0              |
| 0             | 0             | 1             | 1             | 1              | 1              | 0              | 1              |
| 0             | 1             | 0             | 0             | 1              | 1              | 0              | 0              |
| 0             | 1             | 0             | 1             | 1              | 0              | 1              | 1              |
| 0             | 1             | 1             | 0             | 1              | 0              | 1              | 0              |
| 0             | 1             | 1             | 1             | 1              | 0              | 0              | 1              |
| 1             | 0             | 0             | 0             | 1              | 0              | 0              | 0              |
| 1             | 0             | 0             | 1             | 0              | 1              | 1              | 1              |
| 1             | 0             | 1             | 0             | 0              | 1              | 1              | 0              |
| 1             | 0             | 1             | 1             | 0              | 1              | 0              | 1              |
| 1             | 1             | 0             | 0             | 0              | 1              | 0              | 0              |
| 1             | 1             | 0             | 1             | 0              | 0              | 1              | 1              |
| 1             | 1             | 1             | 0             | 0              | 0              | 1              | 0              |
| 1             | 1             | 1             | 1             | 0              | 0              | 0              | 1              |

### Mapa de Karnaugh

Dando como resultado el siguiente mapa de Karnaugh:

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
