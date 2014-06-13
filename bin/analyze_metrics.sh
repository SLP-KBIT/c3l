#!/bin/sh

metric_fu --no-open --format html
ruby -rwebrick -e "WEBrick::HTTPServer.new({DocumentRoot: './tmp/metric_fu/output', Port: 8080}).start"  
