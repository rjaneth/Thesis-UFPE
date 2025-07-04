# Reproducible PhD Thesis in Quarto

This repository contains the source code, manuscript, and supplementary files for my PhD thesis at the Federal University of Pernambuco (UFPE).

## 📝 Description

This thesis was written using [**Quarto**](https://quarto.org/), a modern scientific and technical publishing system.  
It is adapted from the [**quarto-thesis**](https://github.com/nmfs-opensci/quarto-thesis) template and modified to follow the LaTeX thesis format required by the [**Universidade Federal de Pernambuco (UFPE)**]([https://www.ufpe.br/](https://www.overleaf.com/latex/templates/modelo-latex-atualizado-biblioteca-do-ccen-ufpe-versao-1-dot-4-16-dot-10-dot-2020/qbyfytyzzrcy)).

## 📁 Thesis Structure

The folder structure is organized as follows:

```plaintext
Thesis-UFPE/
├── .quarto/                 # Quarto metadata
├── .Rproj.user/             # R project configuration
├── _extensions/            # Quarto extensions including thesis template
├── Appendices/             # Appendices content in .qmd
├── Chapters/               # Main thesis chapters in .qmd
├── Figures/                # Figure outputs
├── Frontmatter/            # Title page, abstract, etc.
├── images/                 # Supporting images
├── site_libs/              # HTML dependencies (auto-generated)
├── .gitignore              # Git ignore file
├── .Rhistory               # R console history
├── .quarto.yml             # Main Quarto configuration file
├── abnt.csl                # Citation style (ABNT - Brazilian)
├── index.qmd               # Main thesis index
├── LICENSE                 # License information
├── MastersDoctoralThesis.cls  # LaTeX class file (not used directly)
├── references.bib          # Bibliographic references
├── references.qmd          # Reference formatting section
├── Thesis.Rproj            # RStudio project file
```

## 🎨 Customizing the Look

The layout and formatting of the thesis are controlled by the `MasterDoctoralThesis.cls` file located in `_extensions/quarto-thesis/`.

You can modify this file to customize:

- Chapter titles
- Fonts and spacing
- LaTeX environments (e.g., theorems, definitions, etc.)

**Important:**  
The `MastersDoctoralThesis.cls` file in the **root folder** is **overwritten** every time you re-render the project.  
Always make changes to the version inside `_extensions/quarto-thesis/`.
---

## 🧪 How to Compile the Thesis

Unlike traditional LaTeX workflows, this thesis uses **Quarto** with **RStudio**. Follow these steps:

1. **Open the file `Thesis.Rproj`** in RStudio.
2. Go to the **Build** tab  and click **"Render Book"**:

   > _This will compile the full thesis, processing all `.qmd` files defined in `_quarto.yml`._

3. Alternatively, you can open `index.qmd` and click **"Render"** to preview or compile the thesis manually.

---

## 🧰 Software Requirements

To run and compile this project, you will need the following:

- [**Quarto**](https://quarto.org/) ≥ **v1.3.0**
- [**R**](https://www.r-project.org/) version: `4.4.2`
- [**RStudio**](https://posit.co/download/rstudio-desktop/) version: `2024.12.1+563`
- [**MikTeX**](https://miktex.org/) (recommended for LaTeX support)
