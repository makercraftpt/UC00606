# 📖 Referência — Ciclos

> [← Voltar à página principal](../README.md)

---

## `while` — enquanto uma condição for verdadeira

```python
contador = 0

while contador < 5:
    print(contador)
    contador += 1

# Imprime: 0 1 2 3 4
```

> ⚠️ Garante que a condição alguma vez se torna `False` — senão o ciclo nunca termina.

---

## `for` — iterar sobre uma sequência

```python
# Iterar sobre uma lista
frutas = ["maçã", "pera", "banana"]
for fruta in frutas:
    print(fruta)

# Iterar sobre uma string
for letra in "cyber":
    print(letra)

# Iterar sobre um dicionário
agente = {"nome": "Ana", "nivel": "ADMIN"}
for chave, valor in agente.items():
    print(f"{chave}: {valor}")
```

---

## `range()` — gerar sequências de números

```python
range(5)          # 0, 1, 2, 3, 4
range(1, 6)       # 1, 2, 3, 4, 5
range(0, 10, 2)   # 0, 2, 4, 6, 8  (passo 2)
range(10, 0, -1)  # 10, 9, 8, ..., 1  (conta para trás)

# Uso típico
for i in range(3):
    print(f"Tentativa {i + 1}")
```

---

## `break` — sair do ciclo imediatamente

```python
for numero in range(10):
    if numero == 5:
        break          # sai do ciclo quando chega ao 5
    print(numero)

# Imprime: 0 1 2 3 4
```

---

## `continue` — saltar para a próxima iteração

```python
for numero in range(6):
    if numero % 2 == 0:
        continue       # salta os pares
    print(numero)

# Imprime: 1 3 5
```

---

## `else` nos ciclos

O bloco `else` corre **apenas se o ciclo terminar normalmente** (sem `break`).

```python
# while...else
tentativas = 0
while tentativas < 3:
    pw = input("Password: ")
    if pw == "cyber2025":
        print("Acesso concedido")
        break
    tentativas += 1
else:
    print("Sistema bloqueado")   # só corre se não houve break

# for...else
for agente in agentes:
    if agente["nome"] == "Ana":
        print("Encontrado!")
        break
else:
    print("Não encontrado")      # só corre se não houve break
```

---

## Acumuladores — padrão comum

```python
# Somar
total = 0
for valor in [10, 20, 30]:
    total += valor
print(total)   # → 60

# Contar
contador = 0
for agente in agentes:
    if agente["ativo"]:
        contador += 1
print(contador)

# Maior valor
maior = None
for valor in [3, 7, 1, 9, 4]:
    if maior is None or valor > maior:
        maior = valor
print(maior)   # → 9
```

---

## Ciclos aninhados

```python
for linha in range(3):
    for coluna in range(3):
        print(f"({linha},{coluna})", end=" ")
    print()   # nova linha

# Imprime:
# (0,0) (0,1) (0,2)
# (1,0) (1,1) (1,2)
# (2,0) (2,1) (2,2)
```

---

## `enumerate()` — índice + valor

```python
nomes = ["Ana", "Bruno", "Carla"]

for i, nome in enumerate(nomes):
    print(f"{i}: {nome}")

# 0: Ana
# 1: Bruno
# 2: Carla

# Começa a contar em 1
for i, nome in enumerate(nomes, start=1):
    print(f"{i}. {nome}")
```

---

## Erros comuns

```python
# ❌ Ciclo infinito — condição nunca muda
x = 0
while x < 5:
    print(x)   # esqueceu: x += 1

# ❌ Modificar a lista enquanto iteras
for item in lista:
    lista.remove(item)   # comportamento imprevisível

# ✅ Itera sobre uma cópia
for item in lista[:]:
    lista.remove(item)
```

---

<sub>← [Voltar](../README.md) · [Semana 3](../semanas/semana03.md) · [Semana 4](../semanas/semana04.md)</sub>
