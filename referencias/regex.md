# 📖 Referência — Expressões Regulares (regex)

> [← Voltar à página principal](../README.md)

---

## O que é um regex?

Um **regex** (regular expression / expressão regular) é um **padrão** que descreve um formato de texto — não um texto exato. Em vez de procurares `"192.168.1.45"` literalmente, descreves a **forma** que qualquer IP tem: "1 a 3 dígitos, ponto, 1 a 3 dígitos, ponto...".

```python
import re

texto = "login OK, IP 10.0.0.5"
m = re.search(r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}", texto)
print(m.group())   # '10.0.0.5'
```

> 💡 Usa sempre `r"..."` (raw string) em padrões regex — evita ter de duplicar as barras invertidas (`\\d` → `\d`).

---

## Os blocos básicos

### Classes de carateres

| Padrão | Significa | Exemplo |
|--------|-----------|---------|
| `\d` | um dígito (0-9) | `\d\d` casa `"42"` |
| `\D` | **não** é um dígito | `\D` casa `"a"`, `" "`, `"@"` |
| `\w` | letra, número ou `_` | `\w+` casa `"agente_07"` |
| `\W` | **não** é letra/número/`_` | `\W` casa `"@"`, `" "`, `"!"` |
| `\s` | espaço, tab ou quebra de linha | `\s+` casa múltiplos espaços |
| `\S` | **não** é espaço | `\S+` casa `"palavra"` |
| `.` | qualquer carácter (exceto quebra de linha) | `a.c` casa `"abc"`, `"a1c"` |
| `[abc]` | um de: `a`, `b` ou `c` | `[aeiou]` casa uma vogal |
| `[^abc]` | qualquer um **exceto** `a`, `b`, `c` | `[^0-9]` casa não-dígitos |
| `[a-z]` | intervalo (a até z) | `[A-Z]` casa uma maiúscula |

### Quantificadores — "quantas vezes?"

| Padrão | Significa | Exemplo |
|--------|-----------|---------|
| `*` | 0 ou mais vezes | `\d*` casa `""`, `"5"`, `"123"` |
| `+` | 1 ou mais vezes | `\d+` casa `"5"`, `"123"` (não casa `""`) |
| `?` | 0 ou 1 vez (opcional) | `https?` casa `"http"` e `"https"` |
| `{n}` | exatamente n vezes | `\d{3}` casa exatamente 3 dígitos |
| `{n,m}` | entre n e m vezes | `\d{1,3}` casa 1 a 3 dígitos |
| `{n,}` | n ou mais vezes | `\d{2,}` casa 2 ou mais dígitos |

### Âncoras — "onde no texto?"

| Padrão | Significa |
|--------|-----------|
| `^` | início da string (ou linha, em modo multiline) |
| `$` | fim da string (ou linha, em modo multiline) |
| `\b` | fronteira de palavra (início/fim de uma palavra) |

```python
re.search(r"^ERRO", "ERRO: falha")       # casa — começa por ERRO
re.search(r"falha$", "login: falha")     # casa — termina em falha
re.search(r"\bIP\b", "o IP mudou")       # casa — "IP" como palavra inteira
re.search(r"\bIP\b", "SKIP")             # NÃO casa — "IP" está dentro de "SKIP"
```

### Grupos e alternância

```python
re.search(r"(gato|cão)", "tenho um cão")           # grupo: uma opção OU outra
re.search(r"(\d{2}):(\d{2}):(\d{2})", "14:32:07")  # grupos capturados

m = re.search(r"(\d{2}):(\d{2}):(\d{2})", "14:32:07")
m.group(0)   # '14:32:07'  — o match completo
m.group(1)   # '14'        — 1º grupo
m.group(2)   # '32'        — 2º grupo
```

### Grupos nomeados (mais legível)

```python
m = re.search(r"(?P<hora>\d{2}):(?P<min>\d{2})", "14:32")
m.group("hora")   # '14'
m.group("min")    # '32'
```

---

## Funções do módulo `re`

| Função | O que faz | Devolve |
|--------|-----------|---------|
| `re.search(p, t)` | Procura o padrão, para no 1º resultado | `Match` ou `None` |
| `re.match(p, t)` | Como `search()`, mas só verifica o **início** da string | `Match` ou `None` |
| `re.findall(p, t)` | Procura **todas** as ocorrências | Lista de strings |
| `re.finditer(p, t)` | Como `findall()`, mas devolve os objetos `Match` (com posição) | Iterador de `Match` |
| `re.sub(p, novo, t)` | Substitui todas as ocorrências | String nova |
| `re.split(p, t)` | Divide o texto pelo padrão (como `str.split()`, mas com regex) | Lista de strings |
| `re.compile(p)` | Pré-compila um padrão para reutilizar | Objeto `Pattern` |

```python
texto = "IP 1.1.1.1 e IP 2.2.2.2 falharam"
padrao = r"\d+\.\d+\.\d+\.\d+"

re.search(padrao, texto)      # 1º Match, ou None
re.findall(padrao, texto)     # ['1.1.1.1', '2.2.2.2']
re.sub(padrao, "***", texto)  # 'IP *** e IP *** falharam'
re.split(r"\s*,\s*", "a, b,c ,  d")   # ['a', 'b', 'c', 'd']
```

### `re.compile()` — quando usar muitas vezes o mesmo padrão

```python
padrao_ip = re.compile(r"\d{1,3}(?:\.\d{1,3}){3}")

for linha in logs:
    m = padrao_ip.search(linha)   # não recompila o padrão a cada chamada
```

---

## Padrões prontos a usar — cheatsheet

```
IP:          \d{1,3}(?:\.\d{1,3}){3}
Email:       \S+@\S+\.\S+
Timestamp:   \d{2}:\d{2}:\d{2}
Data (PT):   \d{2}/\d{2}/\d{4}
URL:         https?://\S+
Código postal (PT): \d{4}-\d{3}
Telefone (PT):       9\d{8}
Só letras:   ^[A-Za-zÀ-ú]+$
```

```python
log = "2026-07-10 14:32:07 IP=10.0.0.5 user@dominio.pt"

data  = re.search(r"\d{4}-\d{2}-\d{2}", log).group()
hora  = re.search(r"\d{2}:\d{2}:\d{2}", log).group()
ip    = re.search(r"\d{1,3}(?:\.\d{1,3}){3}", log).group()
email = re.search(r"\S+@\S+\.\S+", log).group()
```

---

## Boas práticas

- **Usa `r"..."`** (raw string) — evita duplicar barras invertidas.
- **Compila padrões reutilizados** com `re.compile()` fora de loops.
- **Testa o padrão** num site como [regex101.com](https://regex101.com) antes de o usar — mostra exatamente o que cada parte do padrão faz.
- **Grupos nomeados** (`(?P<nome>...)`) tornam o código mais legível do que `group(1)`, `group(2)`.
- **Comenta o que o padrão faz** — regex é difícil de reler passado um tempo.
- **Verifica sempre se `search()`/`match()` encontrou algo** antes de chamares `.group()` — se não encontrar, devolve `None` e `.group()` dá erro.

```python
m = re.search(padrao, texto)
if m:                      # ✔ verificar antes de usar
    print(m.group())
```

---

## Erros comuns

```python
# ❌ Esquecer que pode não encontrar nada
m = re.search(padrao, texto)
print(m.group())            # AttributeError se m for None

# ❌ Barras invertidas sem raw string
padrao = "\d+"               # pode não funcionar como esperas
padrao = r"\d+"               # ✔ correto

# ❌ Usar . (ponto) a pensar que é literal
re.search("192.168.1.1", ip)   # o "." aqui significa "qualquer carácter"!
re.search(r"192\.168\.1\.1", ip)  # ✔ \. = ponto literal

# ❌ Esquecer que findall() com grupos devolve os GRUPOS, não o match completo
re.findall(r"(\d+)\.(\d+)", "10.5 20.3")
# [('10', '5'), ('20', '3')]  — tuplos dos grupos, não '10.5'/'20.3'
```

---

## Regex fora do Python

O **conceito** de regex é universal — só a sintaxe de chamada muda. Um padrão como `\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}` funciona quase sem alterações em qualquer uma destas ferramentas:

| Ação | `grep` (terminal) | JavaScript | SQL (`REGEXP`) | Python |
|------|--------------------|------------|-----------------|--------|
| Procurar | `grep -E 'padrao' ficheiro.txt` | `texto.match(/padrao/)` | `WHERE col REGEXP 'padrao'` | `re.search(padrao, texto)` |
| Todas as ocorrências | `grep -oE 'padrao' -c` | `texto.match(/padrao/g)` | — | `re.findall(padrao, texto)` |
| Substituir | `sed -E 's/padrao/novo/'` | `texto.replace(/padrao/, novo)` | `REGEXP_REPLACE(col, 'p', 'n')` | `re.sub(padrao, novo, texto)` |
| Grupos | `\(...\)` | `(...)` | `(...)` | `(...)` |

> É por isso que vale a pena dominar regex cedo: é uma das poucas ferramentas que usas literalmente em **todas** as linguagens e ferramentas de linha de comandos — incluindo Wireshark, ferramentas de análise de logs, e editores de texto como o VS Code (Ctrl+F com "Use Regular Expression" ligado).

---

## Quando NÃO usar regex

Regex é ótimo para padrões **simples e bem definidos** (IPs, datas, emails). Para estruturas complexas e aninhadas — como **HTML, JSON ou XML** — usa sempre um parser próprio (`json.loads()`, uma biblioteca de HTML) em vez de tentar escrever um regex gigante. Regex não "percebe" estrutura aninhada, só padrões de texto.

---

<sub>← [Voltar](../README.md) · [Strings](strings.md) · [Split/Join](split.md) · [Semana 7](../semanas/semana07.md)</sub>
