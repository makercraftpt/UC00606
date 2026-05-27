# 📅 Semana 2 — Seleção: `if / elif / else`

> **UC00606 · Linguagem Estruturada · Aula 2**  
> Tema: Estruturas de Seleção · Operadores Relacionais e Lógicos · Fluxogramas de Decisão

---

## 🎯 O que aprendemos esta semana

- Tomar decisões no código com **`if`**, **`elif`** e **`else`**
- Comparar valores com **operadores relacionais** (`==`, `!=`, `<`, `>`, `<=`, `>=`)
- Combinar condições com **operadores lógicos** (`and`, `or`, `not`)
- Ler fluxogramas de decisão e traduzir para código Python
- Evoluir a **Missão Contínua** para a versão 0.2

---

## ⚡ Resumo rápido — o essencial

### `if` — executar código apenas se uma condição for verdadeira

```python
idade = int(input("Qual a tua idade? "))

if idade >= 18:
    print("Maior de idade ✅")
```

> 💡 A condição é avaliada como `True` ou `False`. O bloco só corre se for `True`.

---

### `if / else` — duas opções

```python
nota = float(input("Nota: "))

if nota >= 10:
    print("Aprovado ✅")
else:
    print("Reprovado ❌")
```

---

### `if / elif / else` — múltiplas opções

```python
nivel = input("Nível de acesso: ")

if nivel == "admin":
    print("🔓 Acesso total ao sistema")
elif nivel == "user":
    print("🔒 Acesso limitado")
elif nivel == "guest":
    print("👁 Só leitura")
else:
    print("⛔ Acesso negado")
```

> 💡 O Python avalia as condições de cima para baixo e executa apenas **o primeiro bloco verdadeiro**.

---

### Operadores Relacionais

| Operador | Significado | Exemplo | Resultado |
|----------|-------------|---------|-----------|
| `==` | igual a | `5 == 5` | `True` |
| `!=` | diferente de | `5 != 3` | `True` |
| `<` | menor que | `3 < 5` | `True` |
| `>` | maior que | `5 > 3` | `True` |
| `<=` | menor ou igual | `5 <= 5` | `True` |
| `>=` | maior ou igual | `6 >= 5` | `True` |

---

### Operadores Lógicos

| Operador | Significado | Exemplo | Resultado |
|----------|-------------|---------|-----------|
| `and` | E (ambas verdadeiras) | `5 > 3 and 2 < 4` | `True` |
| `or` | OU (pelo menos uma) | `5 > 3 or 2 > 4` | `True` |
| `not` | Negação | `not True` | `False` |

```python
# Exemplo combinado
password = input("Password: ")

if len(password) >= 8 and password.isdigit() == False:
    print("Password aceitável ✅")
else:
    print("Password fraca ❌")
```

---

## 🔷 Fluxograma de Decisão

O fluxograma do **Classificador de Acesso** desta aula está disponível em:

📁 [`referencias/fluxogramas_aula2.drawio`](../referencias/fluxogramas_aula2.drawio)

Abre com [Draw.io](https://app.diagrams.net/) para ver o diagrama completo da estrutura `if / elif / else`.

---

## 🚀 Missão Contínua — v0.2

Esta semana evoluímos o **Simulador de Hacking**. O sistema já pede o nível de acesso e responde com mensagens diferentes:

```python
# ═══════════════════════════════════════════
# MISSÃO CONTÍNUA — Simulador de Hacking v0.2
# ═══════════════════════════════════════════

print("=" * 40)
print("  SISTEMA DE CONTROLO — CyberBase Alpha")
print("=" * 40)

nome = input("Identificação: ")
nivel = input("Nível de acesso (admin/user/guest): ")

if nivel == "admin":
    print(f"\n🔓 Bem-vindo, {nome}. Acesso TOTAL concedido.")
elif nivel == "user":
    print(f"\n🔒 Olá, {nome}. Acesso LIMITADO.")
elif nivel == "guest":
    print(f"\n👁 {nome}, podes observar. Só leitura.")
else:
    print(f"\n⛔ Acesso NEGADO. Identificação '{nivel}' desconhecida.")
```

> Na próxima aula (Semana 3) adicionamos ciclos — o sistema vai pedir a password repetidamente até acertar. 🔁

---

## 📚 Para aprofundar

- [Referência — Seleção](../referencias/selecao.md) — Sintaxe completa, operadores e exemplos
- [Fluxogramas + Draw.io](../referencias/fluxogramas.md) — Como desenhar diagramas de decisão
- [Documentação oficial Python — `if`](https://docs.python.org/pt/3/tutorial/controlflow.html#if-statements)

---

## 💻 Exercícios desta semana

| Ficha | Dificuldade | Tema |
|-------|-------------|------|
| Ficha A | ★ Fácil | Semáforo de Acesso — códigos numéricos 1/2/3 |
| Ficha B | ★★ Médio | Analisador de Passwords — `len()`, `isdigit()`, `isupper()` |
| Ficha C | ★★★ Difícil | Detetor de Phishing — análise de domínios de email |
| Ficha Extra | 🏠 Casa | 5 exercícios extra com XP — para quem acabar cedo ou quiser praticar |

> As fichas em PDF estão disponíveis na pasta `exercicios/`.

---

<sub>UC00606 · Linguagem Estruturada · ETPS · 2025/2026 · Semana 2</sub>
