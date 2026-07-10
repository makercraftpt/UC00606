# 📅 Semana 7 — Strings & Expressões Regulares (regex)

> **UC00606 · Linguagem Estruturada · Aula 7**  
> Tema: Métodos de string · Slicing · f-strings avançadas · `import re` · Padrões para IPs, emails e timestamps em logs

---

## 🎯 O que aprendemos esta semana

- Usar **métodos de string** — `upper()`, `strip()`, `split()`, `replace()`, `find()`
- Cortar strings com **slicing** — `texto[inicio:fim:passo]`, índices negativos
- Escrever **padrões regex** com `import re` — `re.search()` e `re.findall()`
- Distinguir `search()` (para no 1º resultado) de `findall()` (procura todos)
- Reconhecer padrões comuns: **IP**, **email**, **timestamp**
- Boas práticas: `r'...'` (raw strings), `re.compile()`, testar padrões antes de usar
- Evoluir a **Missão Contínua** para a versão 0.6 — analisador de logs com regex

---

## 🖥️ Slides desta aula

[**Abrir apresentação interativa →**](../apresentacoes/aula7.html)

---

## ⚡ Resumo rápido — o essencial

### Slicing

```python
ip = "192.168.1.45"
print(ip[0:3])     # '192'
print(ip[-2:])     # '45'   — índices negativos contam do fim
print(ip[::-1])    # invertido
```

### Métodos essenciais

```python
nome = "agente"
nome.upper()          # 'AGENTE'

txt = "  ola  "
txt.strip()           # 'ola'

log = "ERRO IP falha"
log.split(" ")        # ['ERRO', 'IP', 'falha']
```

> ⚠️ Strings são **imutáveis** — todos estes métodos devolvem um valor novo, nunca alteram o original.

---

### `import re` — quando strings não chegam

```python
import re

texto = "login OK, IP 10.0.0.5"
m = re.search(r"\d+\.\d+\.\d+\.\d+", texto)

if m:
    print(m.group())   # '10.0.0.5'
else:
    print("sem IP encontrado")
```

### `search()` vs `findall()`

```python
logs = "IP 1.1.1.1 e IP 2.2.2.2 falharam"
padrao = r"\d+\.\d+\.\d+\.\d+"

re.search(padrao, logs)    # devolve só o 1º Match (ou None)
re.findall(padrao, logs)   # devolve uma lista com TODOS: ['1.1.1.1', '2.2.2.2']
```

---

### Padrões comuns — cheatsheet

```
IP:        \d{1,3}(\.\d{1,3}){3}
Email:     \S+@\S+\.\S+
Timestamp: \d{2}:\d{2}:\d{2}

\d = dígito        \S = não-espaço
+  = 1 ou mais      {n} = exatamente n vezes
```

> 💡 Usa sempre `r'...'` (raw string) em padrões regex — evita ter de duplicar as barras invertidas (`\\d` → `\d`).

---

## 🔒 Missão Contínua — v0.6

Esta semana o simulador ganhou um **analisador de logs com regex**:

```python
import re

def analisar_logs(logs):
    """Extrai IPs e horas suspeitas de uma lista de logs."""
    p_ip = r"\d{1,3}(\.\d{1,3}){3}"
    p_hora = r"\d{2}:\d{2}:\d{2}"
    for linha in logs:
        ip = re.search(p_ip, linha)
        hora = re.search(p_hora, linha)
        if ip:
            print(hora.group(), ip.group())
    return len(logs)
```

> Na próxima versão (v0.7) vamos passar a guardar estes dados em ficheiros de texto e CSV. 🔧

---

## 📚 Para aprofundar

- [Referência — Strings](../referencias/strings.md) — Sintaxe completa, padrões e exemplos
- [Referência — Dividir e Juntar Strings](../referencias/split.md) — `split`, `rsplit`, `partition`, `join`
- [Referência — Expressões Regulares (regex)](../referencias/regex.md) — cheatsheet completo, boas práticas e regex noutras linguagens
- [Documentação oficial Python — Métodos de string](https://docs.python.org/pt/3/library/stdtypes.html#string-methods)
- [Documentação oficial Python — módulo `re`](https://docs.python.org/pt/3/library/re.html)
- [regex101.com](https://regex101.com) — testar padrões regex online antes de usar

---

## 💻 Exercícios desta semana

| Ficha | Dificuldade | Tema |
|-------|-------------|------|
| Ficha A | ★ Fácil | Formatador de Endereços IP — limpar e validar strings |
| Ficha B | ★★ Médio | Analisador de Logs com Regex — `re.findall()` para IPs e horas |
| Ficha C | ★★★ Difícil | Gerador de Wordlist — variações de uma palavra para testes de força |
| Ficha Extra | 🏠 Casa | 5 desafios extra — domínios de URLs, palavras suspeitas, anagramas |

> As fichas em Word estão disponíveis na pasta `exercicios/`. Ver [ficha completa desta semana](../exercicios/aula7.md).

---

<sub>UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026 · Semana 7</sub>
