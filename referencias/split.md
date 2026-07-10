# 📖 Referência — Dividir e Juntar Strings

> [← Voltar à página principal](../README.md)

---

## `split()` — dividir uma string numa lista

```python
frase = "Ana,Bruno,Carla"
frase.split(",")          # ['Ana', 'Bruno', 'Carla']

log = "14:32:07 ERRO login falhou"
log.split()                # ['14:32:07', 'ERRO', 'login', 'falhou']
```

> 💡 Sem argumento, `split()` divide por **qualquer espaço em branco** (espaços, tabs, quebras de linha) e ignora espaços a mais — é o mais seguro para texto "sujo".

### `split()` com limite (`maxsplit`)

```python
linha = "chave=valor=extra"
linha.split("=", 1)        # ['chave', 'valor=extra']  — só a 1ª ocorrência
```

> Útil quando o valor em si pode conter o separador (ex.: um URL depois de `key=`).

---

## `rsplit()` — dividir a partir do fim

```python
caminho = "pasta/subpasta/ficheiro.py"
caminho.rsplit("/", 1)      # ['pasta/subpasta', 'ficheiro.py']
```

> Igual ao `split()`, mas o `maxsplit` conta a partir do **fim** da string — ótimo para separar a última parte (nome de ficheiro, extensão).

---

## `partition()` — dividir em exatamente 3 partes

```python
email = "ana@etpsico.pt"
email.partition("@")        # ('ana', '@', 'etpsico.pt')
```

> Devolve sempre um tuplo de 3 elementos: **antes**, **separador**, **depois**. Se o separador não existir, devolve `(string_original, '', '')`. Mais previsível que `split()` quando só queres dividir uma vez.

---

## `splitlines()` — dividir por linhas

```python
texto = "linha1\nlinha2\nlinha3"
texto.splitlines()          # ['linha1', 'linha2', 'linha3']
```

> Preferível a `split("\n")` porque também trata `\r\n` (ficheiros Windows) corretamente.

---

## `join()` — o inverso do `split()`

```python
partes = ["Ana", "Bruno", "Carla"]
",".join(partes)            # 'Ana,Bruno,Carla'
" ".join(partes)            # 'Ana Bruno Carla'
```

> ⚠️ `join()` é um método da **string separadora**, não da lista: `separador.join(lista)`, não `lista.join(separador)`.

---

## Padrões úteis

### Processar uma linha de log

```python
linha = "14:32:07 ERRO IP=10.0.0.5 login falhou"
partes = linha.split()

hora = partes[0]
tipo = partes[1]
resto = " ".join(partes[2:])
```

### Ler pares `chave=valor`

```python
config = "utilizador=admin;nivel=3;ativo=true"
for par in config.split(";"):
    chave, valor = par.split("=")
    print(chave, "->", valor)
```

### Contar palavras

```python
frase = "o rato roeu a rolha da bolha"
len(frase.split())          # 8
```

### Extrair a extensão de um ficheiro

```python
ficheiro = "relatorio.final.pdf"
nome, extensao = ficheiro.rsplit(".", 1)
# nome = 'relatorio.final'   extensao = 'pdf'
```

---

## Erros comuns

```python
# ❌ Assumir que há sempre o separador
partes = "sem separador".split("=")
chave, valor = partes    # ValueError! só há 1 elemento na lista

# ✅ Verificar antes
partes = texto.split("=")
if len(partes) == 2:
    chave, valor = partes

# ❌ Esquecer que split() devolve sempre uma LISTA
resultado = "a,b,c".split(",")
print(resultado[0].upper())   # OK
print(resultado.upper())      # AttributeError — resultado é lista, não string

# ❌ join() ao contrário
",".join("abc")     # 'a,b,c' — junta cada CARÁTER, não é isto que queres
lista = ["abc"]
",".join(lista)      # 'abc' — correto, junta os ELEMENTOS da lista
```

---

## `split()` vs regex — quando usar cada um

| Situação | Usa |
|----------|-----|
| Separador é sempre o mesmo carácter fixo (`,`, `;`, espaço) | `split()` |
| O formato varia ou o separador pode ser um de vários (espaços múltiplos, vírgula OU ponto e vírgula) | [regex](regex.md) — `re.split(r'[,;]\s*', texto)` |
| Só preciso de encontrar um padrão dentro do texto, não dividir tudo | [regex](regex.md) — `re.search()` / `re.findall()` |

> 💡 Regra prática: se conseguires descrever o separador com uma palavra ("vírgula", "espaço"), usa `split()`. Se precisares de descrever um **padrão** ("um ou mais espaços", "vírgula ou ponto e vírgula"), usa regex.

---

<sub>← [Voltar](../README.md) · [Strings](strings.md) · [Regex](regex.md)</sub>
