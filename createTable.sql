create table PSRType
(
ID varchar2(500),
name varchar2(500),
description varchar2(500)
);
comment on column PSRType.name is 'Naming.name';
comment on column PSRType.description is 'Naming.description';

create table ACLineSegment
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
r varchar2(500),
x varchar2(500),
bch varchar2(500),
r0 varchar2(500),
x0 varchar2(500),
b0ch varchar2(500),
length varchar2(500),
ratedCurrent varchar2(500),
BaseVoltage varchar2(500),
FromSubstation varchar2(500),
ToSubstation varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
Terminals varchar2(500),
Terminals1 varchar2(500)
);
comment on column ACLineSegment.name is 'Naming.name';
comment on column ACLineSegment.description is 'Naming.description';
comment on column ACLineSegment.r is 'Conductor.r';
comment on column ACLineSegment.x is 'Conductor.x';
comment on column ACLineSegment.bch is 'Conductor.bch';
comment on column ACLineSegment.r0 is 'Conductor.r0';
comment on column ACLineSegment.x0 is 'Conductor.x0';
comment on column ACLineSegment.b0ch is 'Conductor.b0ch';
comment on column ACLineSegment.length is 'Conductor.length';
comment on column ACLineSegment.ratedCurrent is 'ACLineSegment.ratedCurrent';
comment on column ACLineSegment.BaseVoltage is 'ConductingEquipment.BaseVoltage';
comment on column ACLineSegment.FromSubstation is 'ACLineSegment.FromSubstation';
comment on column ACLineSegment.ToSubstation is 'ACLineSegment.ToSubstation';
comment on column ACLineSegment.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column ACLineSegment.Terminals is 'ConductingEquipment.Terminals';
comment on column ACLineSegment.Terminals1 is 'ConductingEquipment.Terminals';

