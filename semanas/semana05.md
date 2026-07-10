# 📅 Semana 5 — Funções: Definir · Chamar · Reutilizar

> **UC00606 · Linguagem Estruturada · Aula 5**  
> Tema: `def` · parâmetros e argumentos · `return` · âmbito de variáveis · docstrings

---

## 🎯 O que aprendemos esta semana

- Definir e chamar **funções** com `def`
- Usar **parâmetros obrigatórios, opcionais e com valor por defeito**
- Devolver resultados com **`return`** — um valor, vários, ou nenhum (`None`)
- Usar o valor de retorno como **sinal de sucesso ou falha**
- Distinguir **variáveis locais e globais** — âmbito
- Documentar funções com **docstrings** e manter um cabeçalho de ficheiro
- Evoluir a **Missão Contínua** para a versão 0.5

---

## 🖥️ Slides desta aula

[**Abrir apresentação interativa →**](../apresentacoes/aula5.html)

---

## ⚡ Resumo rápido — o essencial

### Definir e chamar uma função

```python
def verificar_login(utilizador, password):
    """Verifica credenciais. Devolve True se válido."""
    if utilizador == "admin":
        return True
    return False

resultado = verificar_login("admin", "cyber2025")   # ← chamar a função
```

### Porquê usar funções?

- **Não repetir (DRY)** — escreves o código uma vez, usas quantas vezes precisares
- **Organizar e ler** — divides um problema complexo em partes simples
- **Reutilizar** — a mesma função serve em programas diferentes

---

### Parâmetros

```python
# Obrigatório
def saudar(nome):
    print(f'Ola, {nome}!')

# Com valor por defeito
def saudar(nome, nivel='RECRUTA'):
    print(f'Ola, {nome} [{nivel}]!')

saudar('Ana')            # Ola, Ana [RECRUTA]!
saudar('Ana', 'ADMIN')   # Ola, Ana [ADMIN]!
```

> ⚠️ Parâmetros com valor por defeito vêm sempre **depois** dos obrigatórios.

---

### `return` — um valor, vários, ou nenhum

```python
def quadrado(n):
    return n * n

def minmax(lst):
    return min(lst), max(lst)      # vários valores

def mostrar(msg):
    print(msg)                     # sem return → devolve None
```

### `return` como sinal de estado

```python
def fazer_login(user, pw):
    if user == 'admin' and pw == 'cyber2025':
        return True    # sucesso
    return False        # falha

if fazer_login('admin', 'cyber2025'):
    print('Acesso concedido')
else:
    print('Acesso negado')
```

---

### Âmbito — onde vivem as variáveis

```python
sistema = 'CyberBase'   # global — existe em todo o programa

def iniciar():
    mensagem = 'Sistema iniciado'   # local — só existe aqui
    print(sistema)     # OK — acede ao global
    print(mensagem)    # OK — local existe aqui

iniciar()
print(mensagem)   # ERRO — mensagem não existe aqui!
```

---

## 🗂️ Boas práticas

- **Nome com verbo (snake_case)** — `verificar_login()`, `calcular_media()`
- **Uma função = uma tarefa** — se faz duas coisas, divide em duas
- **Tamanho razoável** — funções curtas (≤ 20 linhas) são mais fáceis de testar
- **Docstring sempre** — uma linha já ajuda: `"""Verifica se o utilizador existe."""`

---

## 🔒 Missão Contínua — v0.5

Esta semana o simulador ganhou **funções com parâmetros e return**:

```python
def relatorio(agentes):
    """Devolve nr de ativos."""
    ativos = 0
    for a in agentes:
        ativo = a['ativo']
        s = "ATIVO" if ativo else "X"
        print(a['nome'], s)
        if ativo:
            ativos += 1
    return ativos
```

> Na próxima versão (v0.6) vamos usar regex para analisar logs. 🔧

---

## 📚 Para aprofundar

- [Referência — Funções](../referencias/funcoes.md) — Sintaxe completa, padrões e exemplos
- [Documentação oficial Python — Funções](https://docs.python.org/pt/3/tutorial/controlflow.html#defining-functions)

---

## 💻 Exercícios desta semana

| Ficha | Dificuldade | Tema |
|-------|-------------|------|
| Ficha A | ★ Fácil | Funções Básicas — saudação, quadrado, par/ímpar, return |
| Ficha B | ★★ Médio | Calculadora de Segurança — parâmetros e return, classificar e reportar |
| Ficha C | ★★★ Difícil | Analisador de Passwords — funções que verificam e combinam resultados |
| Ficha Extra | 🏠 Casa | 5 desafios — Cifra de César, validador de email, gerador de senha |

> Ver [ficha completa desta semana](../exercicios/aula5.md).

---

<sub>UC00606 · Linguagem Estruturada · ETP Sicó · 2025/2026 · Semana 5</sub>
