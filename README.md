# Neural-Style S2I

This image is based off of Anish Athalye's [neural-style](https://github.com/anishathalye/neural-style).

## Usage
```
oc create template -f https://raw.githubusercontent.com/RobGeada/neural-style-s2i/master/template.json
oc new-app --template neural-style --param=STYLE_URL=[url of style image] --param=CONTENT_URL=[url of content image]
```
