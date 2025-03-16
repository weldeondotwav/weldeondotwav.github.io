---
page-title: "A newer kind of page"
page-description: "a more advanced exploration of features"
---

<style>
  .my-new-div {
    border: 1px solid red;
    width: 128px;
    height: 48px;

    display: flex;
    align-items: center;
    justify-content: center
  }

</style>

## An arbitrary canvas!

<!-- styles -->
<style>
  .arbitrary-div {
    border: 1px solid red;
    width: 128px;
    height: 128px;

    display: flex;
    align-items: center;
    justify-content: center
  }
</style>

<!-- structure -->
<div id="arbitrary-div" class="arbitrary-div">
  <canvas id="arbitrary-canvas" width="128" height="128"> simple, geometric shapes and lines </canvas>
</div>

<label for="iterations">iterations:</label>
<input type="text" id="iterations" name="iterations" size="10" />
<button onclick="doRender()">render</button>

<!-- behavior -->
<script>

  function doRender() {
    
    let iters = document.getElementById("iterations").value

    // embedded Sierpiński triangle
    const canvas = document.getElementById("arbitrary-canvas")
    if (canvas.getContext) {
      const ctx = canvas.getContext("2d");
      ctx.fillStyle = "black";
      ctx.fillRect(0, 0, 128, 128);

      ctx.fillStyle = "white";
      let point_size = 1;
      let margin_size = 16;

      // starting points
      let points = [
        {x: margin_size, y: canvas.height - margin_size},
        {x: canvas.width - margin_size, y: canvas.height - margin_size},
        {x: canvas.width/2, y: margin_size},
      ]

      let last_point = points[0]
      for (let p = 0; p < points.length; p++) {
        let pt = points[p]
        ctx.beginPath();
        ctx.ellipse(pt.x, pt.y, point_size, point_size, 0, 0, 2 * Math.PI);
        ctx.stroke();
        ctx.fill();
      }

      for (let i = 0; i < iters; i++) {

        nextIdx = Math.floor(Math.random() * 3);
        next_target = points[nextIdx]

        next_pt = {x: (last_point.x + next_target.x)/2, y: (last_point.y + next_target.y)/2}
        ctx.beginPath();
        ctx.ellipse(next_pt.x, next_pt.y, point_size, point_size, 0, 0, 2 * Math.PI);
        ctx.stroke();
        ctx.fill();
      
        last_point = next_pt
      }
    }
  }

</script>

that's pretty cool
