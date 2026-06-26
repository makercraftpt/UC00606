# 📖 Referência — Seleção

> [← Voltar à página principal](../README.md)

---

## `if` / `elif` / `else`

```python
nota = 15

if nota >= 10:
    print("Aprovado")
elif nota >= 8:
    print("Recurso")
else:
    print("Reprovado")
```

- Só o primeiro bloco verdadeiro é executado.
- `elif` é opcional — podes ter zero ou vários.
- `else` é opcional — apanha tudo o que não foi verdadeiro.

---

## Operadores de comparação

| Operador | Significado | Exemplo |
|----------|-------------|---------|
| `==` | igual a | `x == 5` |
| `!=` | diferente de | `x != 0` |
| `>` | maior que | `nota > 10` |
| `<` | menor que | `idade < 18` |
| `>=` | maior ou igual | `nota >= 10` |
| `<=` | menor ou igual | `tentativas <= 3` |

---

## Operadores lógicos

| Operador | Resultado | Exemplo |
|----------|-----------|---------|
| `and` | verdadeiro se **ambos** forem verdadeiros | `x > 0 and x < 10` |
| `or` | verdadeiro se **pelo menos um** for verdadeiro | `x == 0 or x == 1` |
| `not` | inverte o valor | `not ativo` |

```python
# and
if nota >= 10 and presencas >= 8:
    print("Aprovado")

# or
if opcao == "s" or opcao == "S":
    print("Confirmado")

# not
ativo = False
if not ativo:
    print("Conta inativa")
```

---

## Operador ternário (numa linha)

```python
# Forma longa
if saldo >= 0:
    estado = "positivo"
else:
    estado = "negativo"

# Forma curta (ternário)
estado = "positivo" if saldo >= 0 else "negativo"
```

> 💡 Usa o ternário apenas para expressões simples. Para lógica complexa, usa `if`/`else` normal.

---

## Verificar conteúdo de strings

```python
texto = "cyber"

# Pertença
"cy" in texto         # → True
"xyz" not in texto    # → True

# Métodos úteis
texto.startswith("cy")   # → True
texto.endswith("er")     # → True
texto.isdigit()          # → False
texto.isalpha()          # → True
texto.isupper()          # → False
```

---

## Verificar tipo ou valor especial

```python
x = None

if x is None:
    print("Sem valor")

if x is not None:
    print("Tem valor")

# isinstance para verificar tipo
if isinstance(x, int):
    print("É inteiro")
```

---

## Encadeamento de condições

```python
# Equivalente a: 0 < nota <= 20
if 0 < nota <= 20:
    print("Nota válida")

# Equivalente a: if x == 1 or x == 2 or x == 3
if x in [1, 2, 3]:
    print("Opção válida")
```

---

## Erros comuns

```python
# ❌ Erro: usar = em vez de ==
if x = 5:      # SyntaxError

# ✅ Correto
if x == 5:

# ❌ Erro: comparar com True diretamente (redundante)
if ativo == True:

# ✅ Correto
if ativo:

# ❌ Erro: esquecer os dois-pontos
if nota > 10
    print("...")   # SyntaxError

# ✅ Correto
if nota > 10:
    print("...")
```

---

<sub>← [Voltar](../README.md) · [Semana 2](../semanas/semana02.md)</sub>
