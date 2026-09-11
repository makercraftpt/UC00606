# Erros e Exceções em Python — Referência Rápida

## Estrutura base

```python
try:
    # código que pode falhar
except TipoDeErro:
    # o que fazer se falhar
except (TipoA, TipoB):
    # apanha dois tipos ao mesmo tempo
else:
    # corre APENAS se não houve erro
finally:
    # corre SEMPRE (com ou sem erro)
```

---

## Exceções mais comuns

| Exceção | Quando acontece | Exemplo |
|---|---|---|
| `ValueError` | Valor inválido para o tipo esperado | `int("abc")` |
| `TypeError` | Tipo errado numa operação | `"texto" + 5` |
| `ZeroDivisionError` | Divisão por zero | `10 / 0` |
| `IndexError` | Índice fora dos limites de uma lista | `lista[99]` (lista com 3 elementos) |
| `KeyError` | Chave não existe num dicionário | `d["x"]` (x não existe) |
| `FileNotFoundError` | Ficheiro não encontrado | `open("nao_existe.txt")` |
| `PermissionError` | Sem permissão para ler/escrever ficheiro | `open("/etc/shadow")` |
| `OSError` | Erro geral de sistema de ficheiros | disco cheio, path inválido |
| `AttributeError` | Objeto não tem esse atributo | `None.upper()` |
| `NameError` | Variável não definida | usar `x` sem a ter definido |
| `RecursionError` | Recursão infinita | função que se chama a si própria sem parar |
| `sqlite3.IntegrityError` | Violação de constraint na BD | codename duplicado (UNIQUE) |
| `sqlite3.OperationalError` | Erro operacional na BD | tabela não existe, ficheiro bloqueado |

---

## Apanhar o erro com mensagem

```python
try:
    x = int(input("Número: "))
except ValueError as e:
    print(f"Erro: {e}")
    # mostra: Erro: invalid literal for int() with base 10: 'abc'
```

---

## Lançar erros — `raise`

```python
# Lançar com mensagem personalizada
raise ValueError("O valor tem de ser positivo.")

# Lançar dentro de uma função
def calcular(a, op, b):
    if op not in ("+", "-", "*", "/"):
        raise ValueError(f"Operador '{op}' desconhecido")
    if op == "/" and b == 0:
        raise ZeroDivisionError("Não é possível dividir por zero.")

# Re-lançar depois de registar o erro
try:
    resultado = calcular(10, "%", 2)
except ValueError as e:
    print(f"Input inválido: {e}")
    raise   # propaga o erro para cima
```

---

## Validação de input com loop

```python
def pedir_numero(mensagem):
    while True:
        try:
            return float(input(mensagem))
        except ValueError:
            print("❌ Introduz um número válido.")

def pedir_nivel():
    while True:
        try:
            n = int(input("Nível (1-5): "))
            if not 1 <= n <= 5:
                raise ValueError
            return n
        except ValueError:
            print("❌ Introduz um número entre 1 e 5.")
```

---

## SQLite — erros típicos

```python
import sqlite3

try:
    with sqlite3.connect("agentes.db") as conn:
        conn.execute(
            "INSERT INTO agentes (codename, nivel, ativo) VALUES (?,?,1)",
            ("FALCON", 3)
        )
except sqlite3.IntegrityError:
    print("❌ Codename já existe.")       # violação de UNIQUE
except sqlite3.OperationalError as e:
    print(f"❌ Erro na base de dados: {e}")  # tabela não existe, etc.
```

---

## Ficheiros — erros típicos

```python
try:
    with open("relatorio.txt", "w") as f:
        f.write("dados...")
except FileNotFoundError:
    print("❌ Pasta não encontrada.")
except PermissionError:
    print("❌ Sem permissão para escrever.")
except OSError as e:
    print(f"❌ Erro no ficheiro: {e}")
```

---

## `finally` — fechar recursos

```python
conn = None
try:
    conn = sqlite3.connect("agentes.db")
    # trabalhar com a BD
except sqlite3.OperationalError as e:
    print(f"Erro: {e}")
finally:
    if conn:
        conn.close()   # fecha SEMPRE, mesmo que haja erro
```

> Com `with` o `finally` é desnecessário — o context manager fecha automaticamente.

---

## Os 3 tipos de erros

| Tipo | Quando é detetado | Exemplo |
|---|---|---|
| **Sintaxe** | Antes de correr (parse) | `if x = 5:` (devia ser `==`) |
| **Runtime** | Enquanto corre | `int("abc")` |
| **Lógica** | Nunca (programa corre mas resultado errado) | `media = soma / n+1` em vez de `(soma / n) + 1` |

> `try/except` só apanha erros de **runtime**. Erros de sintaxe impedem o programa de arrancar.

---

*UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026*
