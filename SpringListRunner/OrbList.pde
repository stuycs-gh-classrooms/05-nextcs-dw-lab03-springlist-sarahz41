/*===========================
 OrbList (ALL WORK GOES HERE)
 
 Class to represent a Linked List of OrbNodes.
 
 Instance Variables:
 OrbNode front:
 The first element of the list.
 Initially, this will be null.
 
 Methods to work on:
 0. addFront
 1. populate
 2. display
 3. applySprings
 4. applyGravity
 5. run
 6. removeFront
 7. getSelected
 8. removeNode
 
 When working on these methods, make sure to
 account for null values appropraitely. When the program
 is run, no NullPointerExceptions should occur.
 =========================*/

class OrbList {

  OrbNode front;

  /*===========================
   Contructor
   Does very little.
   You do not need to modify this method.
   =========================*/
  OrbList() {
    front = null;
  }//constructor

  /*===========================
   addFront(OrbNode o)
   
   Insert o to the beginning of the list.
   =========================*/
  void addFront(OrbNode o) {
    if (front != null) {
      o.next = front;
      front.previous = o;
    }
    front = o;
  }//addFront


  /*===========================
   populate(int n, boolean ordered)
   
   Clear the list.
   Add n randomly generated  orbs to the list,
   using addFront.
   If ordered is true, the orbs should all
   have the same y coordinate and be spaced
   SPRING_LEGNTH apart horizontally.
   =========================*/
  void populate(int n, boolean ordered) {
    front = null;
    for (int i = 0; i < n; i++) {
      float x = ordered ? i * SPRING_LENGTH + 50 : random(50, width - 50);
      float y = ordered ? height / 2 : random(50, height - 50);
      addFront(new OrbNode(x, y, random(10, 30), random(10, 100)));
    }
  }//populate

  /*===========================
   display(int springLength)
   
   Display all the nodes in the list using
   the display method defined in the OrbNode class.
   =========================*/
  void display() {
    for (OrbNode current = front; current != null; current = current.next) {
      current.display();
    }
  }//display

  /*===========================
   applySprings(int springLength, float springK)
   
   Use the applySprings method in OrbNode on each
   element in the list.
   =========================*/
  void applySprings(int springLength, float springK) {
    for (OrbNode current = front; current != null; current = current.next) {
      current.applySprings(springLength, springK);
    }
  }//applySprings

  /*===========================
   applyGravity(Orb other, float gConstant)
   
   Use the getGravity and applyForce methods
   to apply gravity crrectly.
   =========================*/
  void applyGravity(Orb other, float gConstant) {
    for (OrbNode current = front; current != null; current = current.next) {
      PVector gravityForce = other.getGravity(current, gConstant);
      current.applyForce(gravityForce);
    }
  }//applySprings

  /*===========================
   run(boolean bounce)
   
   Call run on each node in the list.
   =========================*/
  void run(boolean bounce) {
    for (OrbNode current = front; current != null; current = current.next) {
      current.move(bounce);
    }
  }//applySprings

  /*===========================
   removeFront()
   
   Remove the element at the front of the list, i.e.
   after this method is run, the former second element
   should now be the first (and so on).
   =========================*/
  void removeFront() {
    if (front != null) {
      front = front.next;
      if (front != null) {
        front.previous = null;
      }
    }
  }//removeFront


  /*===========================
   getSelected(float x, float y)
   
   If there is a node at (x, y), return
   a reference to that node.
   Otherwise, return null.
   
   See isSlected(float x, float y) in
   the Orb class (line 115).
   =========================*/
  OrbNode getSelected(int x, int y) {
    for (OrbNode current = front; current != null; current = current.next) {
      if (current.isSelected(x, y)) {
        return current;
      }
    }
    return null;
  }//getSelected

  /*===========================
   removeNode(OrbNode o)
   
   Removes o from the list. You can
   assume o is an OrbNode in the list.
   You cannot assume anything about the
   position of o in the list.
   =========================*/
  void removeNode(OrbNode o) {
    if (o == front) {
      removeFront();
    } else {
      if (o.previous != null) {
        o.previous.next = o.next;
      }
      if (o.next != null) {
        o.next.previous = o.previous;
      }
    }
  }
}//OrbList
