[Back](../../README.md)

[Packages](./packages.md)

## Distribution

[TeX Live](https://www.tug.org/texlive/)

### Linux

LaTeX packages can be installed with `apt-get install`

- `texlive` - main package allowing generating pdf files
- `texlive-extra-utils` - utils package, containing e.g. `texliveonfly` that allows installing missing dependencies on
  the fly
- `texlive-lang-polish` - package with Polish language related stuff

## CLI

### pdflatex

Generates `.pdf` from `.tex` file.

`pdflatex [OPTIONS] FILE`

| Option          | Description                                                                                                                                                               |
|:----------------|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `-interaction=` | `errorstopmode` - stop at error and ask user for intervention <br> `nonstopmode` - no user interaction <br> `batchmode` - no user interaction, minimal prints to terminal |
| `-synctex=`     | `1` or `0`; Enables synchronization (jumping) between pdf and tex source code                                                                                             |

### texliveonfly

Processes `.tex` file and automatically installs missing dependencies.

`texliveonfly [OPTIONS] FILE`

| Option         | Description                                                                                |
|:---------------|:-------------------------------------------------------------------------------------------|
| `--compiler=`  | LaTeX engine, e.g. `pdflatex`                                                              |
| `--arguments=` | String representation of options for engine, e.g. `"-synctext=1 -interaction=nonstopmode"` |

## Commands

### Text formatting

| Command                                                               | Description                                                                                   |
|:----------------------------------------------------------------------|:----------------------------------------------------------------------------------------------|
| `\centering` <br> `\begin{center} ... \end{center}`                   | Center content                                                                                |
| `\raggedright`                                                        | Align left content                                                                            | 
| `\textbf{...}`                                                        | Bold text                                                                                     |
| `\underline{...}`                                                     | Underline text                                                                                |
| `\tiny` `\small` `\normalsize` <br> `\large` `\LARGE` `\huge` `\HUGE` | Set font size                                                                                 |
| `\fontsize{FONTSIZE}{BASELINESKIPSIZE}\selectfont`                    | Set arbitrary font size (baselineskip is distance between lines, should be ~1.2 size usually) |

`\noindent`

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
    item 21 & item 22 & item 23 \\
    \hline
\end{tabularx}
```

### Listings

Unordered list, with specified distance between the items

```latex
\begin{itemize}
  \setlength{\itemsep}{5pt}
  \item item1
  \item item2
  \item item3
\end{itemize}
```

### Layout

| Command                                           | Description                                                           |
|:--------------------------------------------------|:----------------------------------------------------------------------|
| `\begin{minipage}{\textwidth} ... \end{minipage}` | Creates content block (full width) that will be kept on a single page |
| `\setlength{\parindent}{SIZE}`                    | Set paragraph indendation size                                        |
| `\setlength{\parskip}{10pt}`                      | Set distance between paragraph                                        |

### Page numbering

| Command               | Description                                                      |
|:----------------------|:-----------------------------------------------------------------|
| `\thepage`            | Index of current page                                            |
| `\pageref{LabelName}` | Index of page where corresponding `\label{LabelName}` is located |

### Defining command

Creating a command with given name, number of parameters, default values for parameters and content (#1, #2... are
values of the parameters), e.g.:

```latex
\newcommand{\header}[1]{
    \begin{center}
        \textbf{#1}
    \end{center}
}

\header{Header text}
```

```latex
\newcommand{\plusbinomial}[3][2]{(#2 + #3)^#1}

\plusbinomial[4]{x}{y}
```

[Back](../../README.md)
