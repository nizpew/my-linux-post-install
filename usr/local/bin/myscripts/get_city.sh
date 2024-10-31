#!/bin/bash
curl ipinfo.io | grep city | cut -d '"' -f 4

