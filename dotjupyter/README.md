# VIM key bindings for Jupyter

This folder should be linked or copied to `~/.jupyter`.  Note that it does not set a password!

Installation of the vim binding pluging is as per [instructions](https://github.com/lambdalisue/jupyter-vim-binding).

Tested using the following installation:

```bash
dotjupyter [master] $ jupyter --version
jupyter core     : 4.6.1
jupyter-notebook : 6.0.2
...
```

## Dark theme

The CSS for the dark theme was generated using the [jupyterthemes](https://github.com/dunovank/jupyter-themes) package.  **However** it is better to just copy or link the `custom.css` CSS file from this repo, since running the `jt` tool as below will override our custom VIM keybindings by replacing our `custom.js` file.

```bash
conda install -c conda-forge jupyterthemes
jt -t chesterish -vim  # ACHTUNG will overwrite custom.js and VIM keybindings!	
```
