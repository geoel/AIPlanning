Parameter Location : Type. 
Parameter Pile : Type.
Parameter Robot : Type.
Parameter Crane : Type.
Parameter Container : Type.

Parameter adjacent : Location -> Location -> Prop.
Record RobotAtLocation (L:Location) := {robot1 :> Robot}.
Parameter NotOccupiedLocation : Type. 
Axiom notOccupiedLocation : NotOccupiedLocation -> Location. 
Coercion notOccupiedLocation : NotOccupiedLocation >-> Location.
Record CraneBelongingTo (L:Location) := {crane1 :> Crane}.
Record RobotLoadedWith (C:Container) := {robot2 :> Robot}.
Record EmptyCraneBelongingTo (L:Location) := {emptyCrane :> CraneBelongingTo L}.
Record CraneHolding(C:Container) := {crane2 :> Crane}.

Definition move3(from:Location)(r:RobotAtLocation from)(to:NotOccupiedLocation)
        (p1:adjacent from to):= RobotAtLocation to.

Definition unload2(c:Container)(l:Location)(k:EmptyCraneBelongingTo l)
        (r:RobotAtLocation l) := CraneHolding c.

Variable l1 : Location. 
Variable l2 : NotOccupiedLocation.
Variable l1AdjacentL2 : adjacent l1 l2.
Variable r : RobotAtLocation l1.
Variable rAtTo : move3 l1 r l2 l1AdjacentL2.

Variable k2 : EmptyCraneBelongingTo l2.
Variable c : Container.
Variable kHoldingC : unload2 c l2 k2 rAtTo.

Variable kHoldingC1 : unload2 c l1 k2 rAtTo.