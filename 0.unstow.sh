#!/bin/bash

ls --ignore '0.*' | xargs -I {} stow --delete --target $HOME {}
