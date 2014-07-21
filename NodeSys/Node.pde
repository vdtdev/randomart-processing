/**
* Abstract base class for Nodes
* @version 1.0.20130904
* @author Wade Harkins <vdtdev@gmail.com>
*/
abstract class Node implements IConnectable{
  private int fillColor=color(0.5,0.5,0.5);
  private int borderColor=color(0,0,0);
  private PVector size;
  private PVector position;
  public Node(PVector pos, PVector size, int fillColor){
    this.fillColor=fillColor;
    this.position=pos;
    this.size=size;
  }
  
  protected void Render(){
    pushStyle();
    fill(fillColor);
    stroke(borderColor);
    rect(position.x,position.y,size.x,size.y);
    popStyle();
  }
}
