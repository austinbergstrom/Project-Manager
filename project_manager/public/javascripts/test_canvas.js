window.Pen = $.Class.create({
  initialize: function(canvas) {
    this.canvas = canvas;
    this.context = this.canvas.getContext('2d');
//    this.context.strokeStyle = "#000";
    this.previousPos = null;
    this.canDraw = false;// Create an ImageData object.

    this.context.fillStyle = '#00f';
    this.context.strokeStyle = '#f00';
    this.context.lineWidth = 4;

    // Draw a line, then a Bèzier curve.
    this.context.beginPath();
    this.context.moveTo(10, 10);
    this.context.lineTo(100, 100);
    this.context.moveTo(150, 100);

    // Arguments: cp1x, cp1y, cp2x, cp2y, x, y
    // cp = control point.
    this.context.bezierCurveTo(180, 30, 250, 180, 300, 100);
    this.context.stroke();
    this.context.closePath();

    // Draw a circle using the arc function.
    this.context.beginPath();

    // Arguments: x, y, radius, start angle, end angle, anticlockwise
    this.context.arc(125, 115, 30, 0, 360, false);
    this.context.stroke();
    this.context.closePath();

  },
  draw: function(event) {
    if (this.canDraw) {
      var pos = this.getPos(event);
      var previousPos = this.previousPos || pos;
      this.context.moveTo(previousPos[0], previousPos[1]);
      this.context.lineTo(pos[0], pos[1]);
      this.previousPos = pos;
      this.context.stroke();
    }
  },
  toggleDraw: function(event) {
    this.canDraw = !this.canDraw;
    if (!this.canDraw) {
      this.previousPos = null;
    }
  },
  clearPos: function(event) {
    this.previousPos = null;
  },
  getPos: function(event) {
    var pos_x = event.offsetX ? (event.offsetX) : event.pageX - this.canvas.offsetLeft;
    var pos_y = event.offsetY ? (event.offsetY) : event.pageY - this.canvas.offsetTop;
    return [pos_x, pos_y];
  }
});
var pen;
$(document).ready(function() {
  pen = new Pen(document.getElementById('canvas'));

});
