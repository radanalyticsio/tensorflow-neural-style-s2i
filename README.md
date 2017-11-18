# Neural-Style S2I

This image is based off of Anish Athalye's [neural-style](https://github.com/anishathalye/neural-style).

## Usage
```
oc create template -f https://raw.githubusercontent.com/RobGeada/neural-style-s2i/master/template.json
```
To train with default image settings (style=Great Wave off Kanagawa, content=Chicago Skyline):
```
oc new-app --template neural-style
```
To train with custom images:
```
oc new-app --template neural-style --param=STYLE_URL=[url of style image] --param=CONTENT_URL=[url of content image]
```

To evaluate a pre-trained model:
```
oc new-app --template neural-style --param=STYLE_URL=[url of style image] --param=CONTENT_URL=[url of content image] --param=MODEL_URL=[url of model]
```
