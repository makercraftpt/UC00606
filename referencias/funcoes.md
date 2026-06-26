# 📖 Referência — Funções

> [← Voltar à página principal](../README.md)

---

## Definir uma função

```python
def saudar(nome):
    print(f"Olá, {nome}!")

saudar("Ana")     # → Olá, Ana!
saudar("Bruno")   # → Olá, Bruno!
```

```
def nome_da_funcao(parametros):
    """Docstring — descreve o que a função faz."""
    # corpo da função
    return resultado
```

---

## Parâmetros e argumentos

```python
# Parâmetros = variáveis na definição
def calcular_area(largura, altura):
    return largura * altura

# Argumentos = valores passados na chamada
area = calcular_area(5, 3)    # → 15
```

### Parâmetros com valor por omissão

```python
def saudar(nome, nivel="RECRUTA"):
    print(f"Bem-vindo, {nome} | Nível: {nivel}")

saudar("Ana")                   # → Bem-vindo, Ana | Nível: RECRUTA
saudar("Bruno", "ADMIN")        # → Bem-vindo, Bruno | Nível: ADMIN
saudar("Carla", nivel="GUEST")  # → Bem-vindo, Carla | Nível: GUEST
```

> 💡 Parâmetros com valor por omissão têm de vir **depois** dos obrigatórios.

---

## `return` — devolver um resultado

```python
def quadrado(n):
    return n * n

resultado = quadrado(4)   # → 16
print(resultado)
```

Uma função **sem `return`** devolve `None` automaticamente.

```python
def sem_return():
    print("Olá")

x = sem_return()   # imprime "Olá"
print(x)           # → None
```

### Devolver múltiplos valores

```python
def minmax(lista):
    return min(lista), max(lista)

menor, maior = minmax([3, 1, 7, 2])
print(menor, maior)   # → 1 7
```

---

## Docstrings — documentar a função

```python
def classificar_risco(valor):
    """Classifica um sistema pelo nível de risco.

    Args:
        valor: Número entre 0 e 100 (percentagem).

    Returns:
        String com o nível: 'ALTO', 'MEDIO' ou 'BAIXO'.
    """
    if valor >= 80:
        return "ALTO"
    elif valor >= 50:
        return "MEDIO"
    return "BAIXO"
```

Acede à docstring com `help()` ou `.__doc__`:

```python
help(classificar_risco)
print(classificar_risco.__doc__)
```

---

## Âmbito — onde vivem as variáveis

```python
x = 10   # variável global

def func():
    y = 20         # variável local — só existe aqui
    print(x)       # pode ler globais
    print(y)

func()
print(x)   # → 10
print(y)   # NameError — y não existe aqui fora
```

> ⚠️ Evita modificar variáveis globais dentro de funções. Prefere passar por parâmetro e usar `return`.

```python
# ❌ Má prática — depende de variável global
total = 0
def adicionar(valor):
    global total       # necessário para modificar global
    total += valor

# ✅ Boa prática — função pura, sem efeitos laterais
def adicionar(total, valor):
    return total + valor

total = adicionar(total, 5)
```

---

## Funções como blocos reutilizáveis

```python
def validar_password(pw):
    """Verifica se a password tem pelo menos 8 caracteres."""
    return len(pw) >= 8

def fazer_login(utilizador, password):
    """Autentica o agente. Devolve True se bem-sucedido."""
    if utilizador == "admin" and validar_password(password):
        return True
    return False

# Uma função chama a outra
sucesso = fazer_login("admin", "cyber2025")
```

---

## Padrões úteis

### Função que valida e devolve bool

```python
def e_par(n):
    return n % 2 == 0

if e_par(8):
    print("par")
```

### Função que transforma e devolve valor

```python
def normalizar(texto):
    return texto.strip().lower()

entrada = normalizar("  CYBER  ")   # → "cyber"
```

### Função que processa uma lista e devolve contagem

```python
def contar_ativos(agentes):
    """Devolve o número de agentes ativos."""
    count = 0
    for agente in agentes:
        if agente["ativo"]:
            count += 1
    return count

total = contar_ativos(lista_agentes)
```

---

## Erros comuns

```python
# ❌ Chamar antes de definir
resultado = soma(2, 3)   # NameError — função ainda não existe

def soma(a, b):
    return a + b

# ✅ Define sempre antes de chamar

# ❌ Esquecer o return — devolve None
def dobro(n):
    n * 2   # calcula mas não devolve nada

x = dobro(5)
print(x)    # → None (não 10!)

# ✅ Correto
def dobro(n):
    return n * 2

# ❌ Usar variável local fora da função
def calcular():
    resultado = 42

print(resultado)   # NameError
```

---

<sub>← [Voltar](../README.md) · [Semana 5](../semanas/semana05.md)</sub>
