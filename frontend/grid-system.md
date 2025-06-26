# SCSS Grid System

This project includes a simple responsive grid written in SCSS. It provides mixins and optional utility classes for building layouts with a configurable number of columns.

## Installation

1. Install the `sass` package if it is not already present:

   ```bash
   npm install --save-dev sass
   ```

2. Compile `grid.scss` with your build process. With Vite you can import the SCSS file directly in your entry point and it will be processed automatically:

   ```ts
   // main.tsx or index.tsx
   import './styles/grid.scss'
   ```

## Configuration

The grid exposes several SCSS variables in `src/styles/grid.scss`:

```scss
$grid-columns: 12;             // total number of columns
$gutter-size: 1rem;            // space between columns
$breakpoints: (
  sm: 576px,
  md: 768px,
  lg: 992px,
  xl: 1200px
);
```

Override these variables before importing the file if you need different values.

## Mixins

- `container` – sets up a responsive container.
- `row` – creates a flex row with negative gutters.
- `col($n)` – creates a column that spans `$n` of the configured columns.

Example:

```scss
.my-layout {
  @include container;

  .my-row {
    @include row;

    .sidebar { @include col(3); }
    .content { @include col(9); }
  }
}
```

## Utility classes

Utility classes are generated automatically for every column and breakpoint. Examples:

- `.col-6` – spans six columns
- `.col-md-4` – spans four columns when viewport is `md` and above

You can use them directly in your markup:

```html
<div class="container">
  <div class="row">
    <div class="col-12 col-md-8">Main</div>
    <div class="col-12 col-md-4">Sidebar</div>
  </div>
</div>
```

## Notes

This grid forms the basis of our design system. Feel free to tweak the variables or add more breakpoints to suit your project.
