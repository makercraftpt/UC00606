# 📅 Semana 12 — Missão Final: Revisão Geral + Avaliação 2

> **UC00606 · Linguagem Estruturada · Aula 12 · 18/09/2026**
> Tema: revisão das Aulas 7 a 11 · Operação Sicó (Avaliação 2, remota)

---

## 🎯 O que se faz nesta semana

- **Revisar** tudo o que se deu desde a Aula 7 — strings e regex, ficheiros e CSV,
  dicionários, JSON, `hashlib`, SQLite e `try/except`
- Identificar os **erros que mais custam pontos** e como os evitar
- Responder ao **quiz de aquecimento** (15 perguntas, vale 10% da nota)
- Resolver a **Missão Final** — três desafios progressivos, 120 minutos (vale 90%)

---

## 🖥️ Slides desta aula

[**Abrir apresentação interativa →**](../apresentacoes/aula12.html)

---

## ⚡ Cábula-relâmpago — qual ferramenta para qual problema

| Preciso de… | Uso | Aula |
|-------------|-----|------|
| encontrar um padrão dentro de texto | `re.findall()` / `re.search()` | 7 |
| separar campos com um separador fixo | `split("\|")` | 7 |
| guardar linhas de texto ou um relatório | `open(...)` + `write()` | 8 |
| guardar uma tabela para abrir no Excel | `csv.writer` / `csv.DictReader` | 8 |
| guardar estruturas com listas e dicionários | `json.dump()` / `json.load()` | 9 |
| contar ocorrências | `dict` com `.get(k, 0) + 1` | 9 |
| verificar uma password | `hashlib.sha256` — comparar hashes | 9 |
| pesquisar, filtrar e ordenar muitos registos | `sqlite3` + `SELECT ... ORDER BY` | 10 |
| garantir que o programa não morre | `try / except` específico | 11 |

---

## 🧠 Resumo por aula

### Aula 7 — Strings e regex

```python
import re

linha = "2026-09-14 08:26:08 | FAILED | ip=41.203.7.88"

IP = r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"
re.findall(IP, linha)          # ['41.203.7.88']  → lista com TODOS
re.search(IP, linha).group()   # '41.203.7.88'    → o primeiro (ou None)
```

> ⚠️ O ponto, em regex, precisa de `\.` — sozinho significa "qualquer caracter".

### Aula 8 — Ficheiros e CSV

```python
with open("log.txt", "r", encoding="utf-8") as f:
    linhas = f.readlines()

with open("auditoria.log", "a", encoding="utf-8") as f:   # "a" acrescenta
    f.write("2026-09-18 10:42 | OK\n")

import csv
with open("suspeitos.csv", "w", newline="", encoding="utf-8") as f:
    w = csv.writer(f)
    w.writerow(["ip", "tentativas"])
    w.writerows([("41.203.7.88", 14)])
```

> ⚠️ `"w"` apaga tudo o que estava no ficheiro. Valores lidos de um CSV são
> **sempre texto** — usa `int(...)` antes de comparar com números.

### Aula 9 — dict, JSON e hashlib

```python
contagem = {}
for ip in ips:
    contagem[ip] = contagem.get(ip, 0) + 1      # nunca dá KeyError

import json, hashlib
dados = json.load(open("credenciais.json", encoding="utf-8"))
h = hashlib.sha256("Sico_2026!".encode()).hexdigest()
```

> 💡 Procurar num `dict` ou `set` é O(1); numa `list` é O(n).

### Aula 10 — SQLite

```python
import sqlite3
with sqlite3.connect("incidentes.db") as conn:
    conn.row_factory = sqlite3.Row
    linhas = conn.execute(
        "SELECT * FROM incidentes WHERE ip LIKE ? ORDER BY tentativas DESC",
        (f"%{termo}%",)).fetchall()
```

> ⚠️ Nunca montes SQL com f-strings — é assim que se abre a porta ao SQL injection.
> E cuidado com a vírgula: `(valor,)` é um tuplo, `(valor)` não é.

### Aula 11 — try / except

```python
def pedir_inteiro(msg, minimo=1, maximo=5):
    while True:
        try:
            v = int(input(msg))
            if not minimo <= v <= maximo:
                raise ValueError
            return v
        except ValueError:
            print(f"Introduz um número entre {minimo} e {maximo}.")
```

> ⚠️ `except:` e `except Exception: pass` escondem o erro e tornam o debugging
> impossível. Captura a exceção específica e dá sempre feedback.

---

## 🐞 Os erros que mais custaram pontos

| ❌ O erro | ✅ A correção |
|-----------|--------------|
| `r"\d.\d.\d.\d"` — pontos não escapados | `r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"` |
| Abrir em `"w"` quando se queria acrescentar | `"a"` para logs e auditoria |
| Comparar texto do CSV com número: `"14" > 5` | `int(linha["tentativas"]) > 5` |
| `contagem[ip] += 1` numa chave nova | `contagem.get(ip, 0) + 1` |
| SQL construído com f-string | Parâmetros `?` e tuplo `(valor,)` |
| Password guardada em claro | Guardar só `sha256(...).hexdigest()` |
| `except:` vazio | Exceção específica + mensagem ao utilizador |
| Ficheiro sem cabeçalho de identificação | Docstring no topo: ficheiro, UC, aula, autor, data |

---

## 🧩 A Missão Final

Três desafios encadeados pela história, pontuados em separado:

| | Desafio | O que treina | Tempo | Pontos |
|---|---------|--------------|-------|--------|
| ★ | **Triagem de Logs** | regex · ficheiros · dict · CSV | 35 min | 30 |
| ★★ | **Cofre de Credenciais** | JSON · hashlib · try/except · append | 45 min | 40 (+5) |
| ★★★ | **Base de Dados de Incidentes** | SQLite · parâmetros seguros · menu robusto | 40 min | 30 |

**Material de partida:**
[`logs_servidor.txt`](../exercicios/dados/aula12/logs_servidor.txt) ·
[`credenciais.json`](../exercicios/dados/aula12/credenciais.json)

**Nota final** = 0,9 × (pontos da missão / 100) + 0,1 × (acertos do quiz / 15)

---

## 🔗 Referências úteis

- [Strings](../referencias/strings.md) · [Dividir e juntar](../referencias/split.md) · [Regex](../referencias/regex.md)
- [Ficheiros, datas e sistema](../referencias/ficheiros_sistema.md) · [Coleções](../referencias/colecoes.md)
- [Erros e exceções](../referencias/erros.md) · [Funções](../referencias/funcoes.md)
- [Menus e formatação de texto](../referencias/menus_formatacao.md)

---

<sub>UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026</sub>
