# 📖 Referência — Variáveis e Tipos de Dados

> [← Voltar à página principal](../README.md)

---

## Declarar uma variável

```python
nome   = "Agente X"     # string
idade  = 21             # int
altura = 1.80           # float
ativo  = True           # bool
```

Não há palavra-chave especial — basta escrever `nome = valor`.

---

## Tipos de dados

| Tipo | O que guarda | Exemplos |
|------|-------------|---------|
| `str` | Texto | `"olá"`, `"123abc"`, `''` |
| `int` | Número inteiro | `0`, `42`, `-7`, `1_000_000` |
| `float` | Número decimal | `3.14`, `-1.5`, `0.0` |
| `bool` | Verdadeiro/Falso | `True`, `False` |
| `None` | Ausência de valor | `None` |

---

## Conversão entre tipos

```python
# str → int / float
n = int("42")         # → 42
x = float("3.14")     # → 3.14

# int / float → str
s = str(42)           # → "42"

# Qualquer coisa → bool
bool(0)       # → False
bool(1)       # → True
bool("")      # → False
bool("abc")   # → True
bool(None)    # → False
```

> ⚠️ `int("3.14")` dá **erro**. Primeiro converte para float: `int(float("3.14"))` → `3`

---

## Verificar o tipo

```python
type(42)        # → <class 'int'>
type("olá")     # → <class 'str'>
type(True)      # → <class 'bool'>

isinstance(42, int)    # → True
isinstance("x", str)  # → True
```

---

## Regras para nomes de variáveis

| ✅ Válido | ❌ Inválido |
|----------|-----------|
| `nome` | `1nome` (começa com número) |
| `nome_completo` | `nome completo` (tem espaço) |
| `x1` | `class` (palavra reservada) |
| `_privado` | `minha-var` (hífen não é válido) |

> 💡 Convenção Python: usa `snake_case` — palavras em minúsculas separadas por `_`.

---

## Operações com strings

```python
s = "cyber"

len(s)            # → 5  (comprimento)
s.upper()         # → "CYBER"
s.lower()         # → "cyber"
s.capitalize()    # → "Cyber"
s + "security"    # → "cybersecurity"  (concatenação)
s * 3             # → "cybercybercyber"  (repetição)
s[0]              # → "c"  (primeiro caracter)
s[-1]             # → "r"  (último caracter)
s[1:4]            # → "ybe"  (slicing)
```

---

## Operações numéricas

```python
10 + 3    # → 13   adição
10 - 3    # → 7    subtração
10 * 3    # → 30   multiplicação
10 / 3    # → 3.333...  divisão (sempre float)
10 // 3   # → 3    divisão inteira
10 % 3    # → 1    resto (módulo)
10 ** 3   # → 1000  potência
```

---

<sub>← [Voltar](../README.md) · [Semana 1](../semanas/semana01.md)</sub>
