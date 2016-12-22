## vim-php-cs
vim-php-cs bundle for vim
This bundle provides file format for php. It based on [php-cs-fixer](https://github.com/FriendsOfPHP/PHP-CS-Fixer).


## Installation
### Install with [Vundle](https://github.com/gmarik/vundle)

Add to vimrc:
```
Plugin 'cyrnicolase/vim-php-cs'
```

And install it:
```
:so %
:BundleInstall
```


## Configuration Variables
The following variables control format plugins. You can add them to your `.vimrc` to enable their features.

```
let g:phpcs_php_path = 'php'
```
The path of `php`

-------------------------

```
let g:phpcs_path = '/home/work/bin/php-cs-fixer'
```
The absolute path of `php-cs-fixer`

-------------------------

```
let g:phpcs_using_cache = 0
```
Disable php-cs-fixer using cache file.<br />
Default Value: 1

-------------------------

```
let g:phpcs_rules = @PSR2
```
Which rules you need or need not.

-------------------------
