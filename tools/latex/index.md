[Back](../../README.md)

## Commands

### Text formatting

Command | Description
---:|:---
`\centering` <br> `\begin{center} ... \end{center}` | Center content
`\textbf{...}` | Bold text
`\tiny` `\small` `\normalsize` <br> `\large` `\LARGE` `\huge` `\HUGE` | Set font size
`\noindent`

## Tables

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


[Back](../../README.md)
