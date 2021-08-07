# vanilla-component.js

vanilla-component.js

# overview

It's just template library with vanilla JavaScript.

# features

- [x] fetch template files and rendering to target DOM

# Example

![image](https://user-images.githubusercontent.com/33514304/128613162-ea03d9c6-828d-475d-88d8-311f38f2cca8.png)

```html
<div class="greeting">
  <h2>Hello World!!!!!</h2>
</div>

<style>
  .greeting h2 {
    color: skyblue;
    font-weight: bold;
    font-size: 50px;
    text-align: center;
  }
</style>
```

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>demo</title>
    <script src="//cdn.creco.me/packages/vanilla-component.js/0.0.1/vanilla-component.min.js"></script>
  </head>

  <body>
    <VanillaComponent src="components/greeting" />
  </body>
</html>
```
