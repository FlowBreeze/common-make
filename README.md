# Makefile Utils

## Usage

1. Add 'update-make-deps' target in your project Makefile.
    ```makefile
    update-make-deps: .make/common-make
   
    .make/common-make:
        git -C $@ pull || git clone https://github.com/flowbreeze/common-make.git $@
    ```
2. Update dependencies:
    ```shell
   make update-make-deps
    ```
3. Add `include .make/common-make/Makefile.include` to your Makefile.