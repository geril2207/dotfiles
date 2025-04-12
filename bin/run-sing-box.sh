#!/usr/bin/env bash

cd ~/.config/sing-box

pkexec --user root sing-box run -c ~/.config/sing-box/ignored/$1
