# 💻 Exercícios — Aula 1

> **UC00606 · Linguagem Estruturada · Aula 1 — Bem-vindos à Matrix**  
> Tema: Variáveis · `input()` · `print()` · f-strings · Python 3

---

## Exercícios desta aula

| # | Nome | Dificuldade | Duração | Modalidade |
|---|------|-------------|---------|------------|
| [#1](#exercício-1) | Cartão de Identidade de Agente | ★ Fácil | 45 min | Individual |
| [#6](#exercício-6) | Perfil de Sistema | ★★ Médio | 60 min | Individual |
| [#9](#exercício-9) | Conversor IPv4 para Binário | ★★★ Difícil | 45 min | Em Pares |

---

## Exercício #1

### Cartão de Identidade de Agente ★ Fácil

**Missão Contínua v0.1 — Simulador de Hacking**

> Este exercício é a base do jogo que vais desenvolver ao longo das 12 aulas.

**O programa deve:**
1. Mostrar um banner de abertura
2. Pedir o nome real do agente
3. Pedir o codinome (pode ser inventado!)
4. Mostrar uma mensagem de boas-vindas personalizada
5. Mostrar o nível inicial: `RECRUTA`

**Exemplo de execução:**
```
=== SISTEMA DE INFILTRAÇÃO v0.1 ===
Identificação necessária.

Qual o teu nome? João
Escolhe o teu codinome: Phantom

>>> Bem-vindo, Agente Phantom!
>>> Identidade: João | Nível: RECRUTA
>>> Missão aceite. Boa sorte.
```

**Código inicial:**
```python
# Simulador de Hacking — v0.1
# Autor: _______________________

print("===================================")
print("  SISTEMA DE INFILTRAÇÃO v0.1")
print("===================================")
print()

nome     = input("Qual o teu nome? ")
codinome = input("Escolhe o teu codinome: ")

print()
# TODO: mostrar as mensagens de boas-vindas
# usa f-strings para incluir nome e codinome
```

<details>
<summary>💡 Pista (só consulta depois de tentares)</summary>

```python
print(f">>> Bem-vindo, Agente {codinome}!")
print(f">>> Identidade: {nome} | Nível: RECRUTA")
```
</details>

**Desafio extra:**
- Mostra o codinome em MAIÚSCULAS — usa `.upper()`
- Adiciona um código de agente aleatório: `import random; random.randint(1000, 9999)`
- Guarda o ficheiro como `simulador_hacking.py` — vais continuar em cada aula!

---

## Exercício #6

### Perfil de Sistema ★★ Médio

**O programa deve:**
1. Pedir: nome, ano de nascimento, sistema operativo favorito, linguagem de programação preferida, nível de experiência (1–10)
2. Calcular: idade e classificação do nível (Iniciante/Intermédio/Avançado)
3. Mostrar um relatório formatado com caixa

**Exemplo de saída:**
```
╔══════════════════════════════════════════════════╗
║           PERFIL DO AGENTE — CYBERCODE           ║
╠══════════════════════════════════════════════════╣
║  Nome:        Maria Silva                        ║
║  Idade:       22 anos                            ║
║  Sistema:     Linux                              ║
║  Linguagem:   Python                             ║
║  Nível:       7/10  (Avançado)                   ║
╚══════════════════════════════════════════════════╝
Bem-vinda, Maria! Excelente nível de experiência!
```

**Código inicial:**
```python
ano_nascimento = int(input("Ano de nascimento: "))
idade = 2026 - ano_nascimento

nivel = int(input("Nível (1-10): "))
if nivel <= 3:
    classificacao = "Iniciante"
elif nivel <= 6:
    classificacao = "Intermédio"
else:
    classificacao = "Avançado"

# Exemplo de linha formatada
print(f"Nome: {nome:<30}")  # alinha à esquerda em 30 caracteres
```

<details>
<summary>💡 Pista</summary>

Para a caixa, usa `"╔"`, `"═"`, `"╗"`, `"║"`, `"╚"`, `"╝"`, `"╠"`, `"╣"`.  
`"═" * 50` repete o carácter 50 vezes.
</details>

**Desafio extra:** Mensagem diferente por nível — Iniciante / Analista / Especialista.

---

## Exercício #9

### Conversor IPv4 para Binário ★★★ Difícil

**Modalidade: Em Pares** — uma pessoa escreve, a outra revê. A meio do exercício, trocam de teclado.

**O programa deve:**
- Ler um endereço IPv4 (ex: `192.168.1.1`)
- Mostrar cada octeto em binário com 8 bits

**Exemplo de execução:**
```
Introduz o endereço IPv4: 192.168.1.1
Resultado:
192  →  11000000
168  →  10101000
  1  →  00000001
  1  →  00000001

IP em binário: 11000000.10101000.00000001.00000001
```

**Conceitos necessários:**

| Função | O que faz | Exemplo |
|--------|-----------|---------|
| `"192.168.1.1".split(".")` | Divide pelo separador | `["192","168","1","1"]` |
| `int("192")` | String → inteiro | `192` |
| `bin(192)` | Inteiro → binário | `"0b11000000"` |
| `"0b11000000".replace("0b","")` | Remove prefixo | `"11000000"` |
| `"11000000".zfill(8)` | Completa com zeros | `"11000000"` |

**Código inicial:**
```python
# Exercício #9 — Conversor IPv4 para Binário
# Nomes: _______________ e _______________

ip = input("Introduz o endereço IPv4: ")
octetos = ip.split(".")

resultado = []
for octeto in octetos:
    numero = int(octeto)
    binario = bin(numero)
    # TODO: remover '0b' e completar com zeros (zfill)
    resultado.append(binario)

ip_binario = ".".join(resultado)
print("IP em binário:", ip_binario)
```

<details>
<summary>💡 Pista</summary>

```python
binario = bin(numero).replace("0b", "").zfill(8)
```
</details>

**Desafio extra:** Validar que cada octeto está entre 0 e 255. Se não estiver, mostrar erro.

---

<sub>← [Semana 1](../semanas/semana01.md) · [Voltar](../README.md)</sub>
