Parameter Location : Type. 
Parameter Pile : Type.
Parameter Robot : Type.
Parameter Crane : Type.
Parameter Container : Type.

Parameter adjacent : Location -> Location -> Prop.
Parameter atLocation : Robot -> Location -> Prop.
Parameter occupied : Location -> Prop.
Parameter belong : Crane -> Location -> Prop.
Parameter loaded : Robot -> Container -> Prop.
Parameter empty : Crane -> Prop.
Parameter holding : Crane -> Container -> Prop.

Definition move3(r:Robot)(from to:Location)(p1:adjacent from to)
                (p2:atLocation r from)(p3:not (occupied to)) := atLocation r to.

Definition unload2(k:Crane)(c:Container)(r:Robot)(l:Location)(p1:belong k l)
                (p2:atLocation r l)(p3:loaded r c)(p4:empty k) := holding k c.

Variable l1 l2 : Location.
Variable l1AdjacentL2 : adjacent l1 l2.
Variable r : Robot.
Variable rAtL1 : atLocation r l1.
Variable l2NotOccupied : not (occupied l2).
Variable rAtTo : move3 r l1 l2 l1AdiacentL2 rAtL1 l2NotOccupied.

Variable k1 : Crane.
Variable k1BelongL1 : belong k1 l2.
Variable c : Container.
Variable rLoadedC : loaded r c.
Variable emptyK : empty k1.
Variable kHoldingC : unload2 k1 c r l2 k1BelongL1 rAtTo rLoadedC emptyK.

Variable kHoldingC1 : unload2 k1 c r l1 k1BelongL1 rAtTo rLoadedC emptyK.