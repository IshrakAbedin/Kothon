<!-- Written by Mohammad Ishrak Abedin-->
# Kothon (কথন)

A $\mathrm{Lua}\mathrm{\LaTeX}$ package to simplify Bangla typesetting and provide transliteration via built-in [Avro Phonetic](https://en.wikipedia.org/wiki/Avro_Keyboard) support.

## Dependencies

This package works only with a $\mathrm{Lua}\mathrm{\LaTeX}$ compiler (2020 or afterwards). It requires the following $\mathrm{\LaTeX}$ packages to work properly:

- `luacode`
- `fontspec`
- `polyglossia`
- `enumitem`

Along with that, make sure the necessary/used fonts are installed in your system. By default, the package tries to utilize Google's Noto Family fonts as much as possible, such as `Noto Sans Bengali`, `Noto Serif Bengali`, etc. Along with that, it contains references to GNU's `FreeSans`, `FreeSerif`, `FreeMono` fonts. The choices are based on the direct availability of fonts in [Overleaf](https://www.overleaf.com/learn/latex/XeLaTeX#Fonts_installed_on_Overleaf's_servers:_Google_Noto_fonts), since it is one of the most preferred and commonly used $\mathrm{\LaTeX}$ editors/service.

The Avro Phonetic transliteration system is built upon [`LuaAvroPhonetic`](https://github.com/IshrakAbedin/LuaAvroPhonetic).

## Including in Project
To use the package in your own project, simply copy all the files inside the [`package`](./package/) directory to the root of your project.

## Example Usage

First, include the package in your project by writing the following statement in your root `.tex` file:

```latex
\usepackage{kothon}
```

### Utilizing Avro Phonetic transliteration

Just including the package allows you to utilize Avro transliteration by using a command similar to the following:

```latex
% \avro{text to be transliterated}
\avro{BhaSHa hOk \textbf{unmukto}!}
```

However, two things to notice. Unless you are in a Bangla environment, glyphs will not render properly. And, as of now, the `\avro` command only supports sentences or a single paragraph. It will not work with multiple paragraphs. The `\avro` command escapes basic commands within it, allowing you to bold and/or underline texts. However, it might fail in the case of complex commands. Also, if you want to create sections, subsections using transliteration, write similar to `\avro{\section{BhUmika}}` and not ~~`\section{\avro{BhUmika}}`~~.

### Setting up Bangla environments

#### As a second language

If you want to use Bangla only at specific places but keep the rest of the document in English, include **one of the following** commands in your preamble:

```latex
\documentclass ...

% with default fonts
\setbanglaother
% OR with custom fonts (Make sure the font is present)
\setbanglaother[Noto Serif Bengali]
% the command can take a second optional argument, fontspec font setup parameters, default is [Renderer=HarfBuzz, Script=Bengali]. If you don't know what these are, don't bother about it.
...

\begin{document}
    ...
\end{document}
```

Make sure that you have the required fonts installed in your system (default is [Noto Sans Bengali](https://fonts.google.com/noto/specimen/Noto+Sans+Bengali)). Once you have declared the command (only one version), now you can use Bangla in your document in one of the following ways:

```latex
...
\begin{document}
    You can directly write Bangla, \textbangla{ভাষা হোক উন্মুক্ত}.
    Or you can use transliteration, \textbangla{\avro{BHasha hOk unmukto.}}

    You can also write in an environment:
    \begin{bangla}
        \avro{BhaSHa hOk unmukto.} আমি বাংলায় গান গাই।
    \end{bangla}
\end{document}
```

For the environment or writing commands, `bangla` and `bengali` are interchangable. That is, `\textbengali{...}` will work as well.


#### As the primary language

If you want to use Bangla as the primary language of your document and English as a second langauge, instead of `\setbanglaother`, in the preamble, write **one of the following** commands:

```latex
% with default fonts
\setbanglaother
% OR with custom fonts for Bangla (Make sure the font is present)
\setbanglaother[Noto Serif Bengali]
% OR with custom fonts for Bangla and English (Make sure the fonts are present)
\setbanglaother[Noto Serif Bengali][Fira Sans]
% the command can take a third optional argument, fontspec font setup parameters, default is [Renderer=HarfBuzz, Script=Bengali]. If you don't know what these are, don't bother about it.
```

Now in your main document, you can write Bangla without requiring any command or environment to switch the language. Even document part and enumeration numberings will be in Bangla. However, to use English, you need to switch language using the `\textenglish{...}` command or the `english` environment, like:

```latex
...
\begin{document}
    \textenglish{You can directly write Bangla}, ভাষা হোক উন্মুক্ত.
    \textenglish{Or you can use transliteration}, \avro{BhaSHa hOk unmukto.}

    \textenglish{You can write English in an environment:}
    \begin{english}
        Let language be boundless. I sing in English.
    \end{english}
\end{document}
```

#### Alternative document level setups
Bangla fonts do not really have much bold, italic, etc. variations in all the cases. On top of that, monospaced Bangla fonts are rare. However, if you want to set the whole document with different types of Bangla fonts, you can use:

```latex
\setbanglamainx[<Bangla Serif Font>][<Bangla Sans Font>][<Bangla Mono Font>][<English Font>][<Additional Fontspec Params>]
% Defaults fonts are Noto Serif Bengali, Noto Sans Bengali, Noto Sans Bengali, and Latin Modern Roman respectively
```

Similarly, for utilizing universal fonts (fonts containing glyphs of both Bangla and English in this case, NOT RECOMMENDED), you can use:

```latex
% NOT RECOMMENDED
\setbanglamainu[<Universal Serif Font>][<Universal Sans Font>][<Universal Mono Font>][<Additional Fontspec Params>]
% Defaults fonts are FreeSerif, FreeSans, and FreeMono respectively
```

#### Even more customizations
The commands that are provided with this package are written to make typesetting in Bangla easy and simple. But it can be restrictive to granular controls. If even more fine tuning is required, it is advised to directly resort to `fontspec` and `polyglossia` $\mathrm{\LaTeX}$ packages.

### The Legal List
While `polyglossia` can translate Arabic numerals to Bangla properly, it does not have support for alphabetic numerals, like a, b, c, d, etc. that are used in nested `enumerate`-like environments. To hack around this, the `llist` or legal list custom enumeration has been introduced. It numbers like $1. \rightarrow 1.1. \rightarrow 1.1.1.$ in different levels. So, if you are using Bangla as the main language, then using the legal list would result in having proper numbering. If you want Bangla alphabets in a list, you can always manually type `\item[\avro{k)}] ... \item[\avro{kh)}]` etc.

## License
The package `Kothon` (কথন) is released under two different licenses. [`kothon.lua`](./package/kothon.lua) is released under the terms of the Mozilla Public License 2.0. An online copy of the license can be found at [MPL 2.0](https://mozilla.org/MPL/2.0/). Rest of the files are licensed under MIT license. Copies of the license texts are included in [LICENSE](./LICENSE). Copyright (c) 2024 Mohammad Ishrak Abedin.