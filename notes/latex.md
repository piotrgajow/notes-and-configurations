[Back](../README.md)

## Commands

### Formatting

- Centering `/centering` or `/begin{center} ... /end{center}`
- Bold `\textbf{...}`
- Size `\tiny`, `\small`, `\normalsize`, `\large`, `\LARGE`, `\huge`, `\HUGE`
- Remove indentation `/noindent`

### Tables

- Table width
    - `\textwidth` width of text content 
- Column definition
    - `l`, `c`, `r` - left, center, light aligned
    - `X` - uses remaining table size (auto width)
    - `>{\raggedright\arraybackslash}X` - auto left
    - `>{\centering\arraybackslash}X` - auto center
    - `>{\raggedleft\arraybackslash}X` - auto right
    - `|` horizontal line
- Content
    - `&` - column separator
    - `\\` - newline
    - `\hline` - horizontal line

```latex
\begin{tabularx}{0.8\textwidth} { 
  | >{\raggedright\arraybackslash}X 
  | >{\centering\arraybackslash}X 
  | >{\raggedleft\arraybackslash}X | }
 \hline
 item 11 & item 12 & item 13 \\
 \hline
 item 21  & item 22  & item 23  \\
 \hline
\end{tabularx}
```

### Defining command

Creating a command with given name, number of parameters, default values for parameters and content (#1, #2... are values of the parameters), e.g.:

```latex
\newcommand{\header}[1]{\begin{center}\textbf{#1}\end{center}}

\header{Header text}
```

```latex
\newcommand{\plusbinomial}[3][2]{(#2 + #3)^#1}

\plusbinomial[4]{x}{y}
```

## Packages

### Geometry [🔗](https://ctan.org/pkg/geometry)

Customizing page layout, margins, auto-centering etc.

```latex
\usepackage[a4paper,left=1in,right=1in,top=1in,bottom=1in]{geometry}
```

### Inputenc [🔗](https://ctan.org/pkg/inputenc)

Character encoding

```latex
\usepackage[utf8]{inputenc}
```

### Polski [🔗](https://ctan.org/pkg/polski)

Usage of polish language - hyphenation patterns, font encoding, translations, math symbols etc.

```latex
\usepackage{polski}
```

### Tabularx [🔗](https://ctan.org/pkg/tabularx)

Extension for tables adding auto-width columns

```latex
\usepackage{tabularx}
```

### Hyperref [🔗](https://ctan.org/pkg/hyperref)

Handles cross-referencing commands to produce hypertext links in the document.

```latex
\usepackage{hyperref}

\hypersetup{
    colorlinks=true,
    urlcolor=blue
}
```

### Lipsum [🔗](https://ctan.org/pkg/lipsum)

```latex
\usepackage{lipsum}
```

---

[Back](../README.md)
