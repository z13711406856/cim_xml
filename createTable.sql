create table Measurement
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
aliasName varchar2(500),
emergencyLimit_winter varchar2(500),
emergencyLimit_summer varchar2(500),
operationLimit varchar2(500),
emergencyLimit varchar2(500),
MemberOf_PSR varchar2(500),
MeasurementType varchar2(500),
Unit varchar2(500)
);
comment on column Measurement.name is 'Naming.name';
comment on column Measurement.description is 'Naming.description';
comment on column Measurement.aliasName is 'Naming.aliasName';
comment on column Measurement.emergencyLimit_winter is 'Measurement.emergencyLimit_winter';
comment on column Measurement.emergencyLimit_summer is 'Measurement.emergencyLimit_summer';
comment on column Measurement.operationLimit is 'Measurement.operationLimit';
comment on column Measurement.emergencyLimit is 'Measurement.emergencyLimit';
comment on column Measurement.MemberOf_PSR is 'Measurement.MemberOf_PSR';
comment on column Measurement.MeasurementType is 'Measurement.MeasurementType';
comment on column Measurement.Unit is 'Measurement.Unit';

create table Substation
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
aliasName varchar2(500),
MemberOf_SubControlArea varchar2(500),
PSRType varchar2(500),
Zones varchar2(500),
SubGeographicalRegion varchar2(500)
);
comment on column Substation.name is 'Naming.name';
comment on column Substation.description is 'Naming.description';
comment on column Substation.aliasName is 'Naming.aliasName';
comment on column Substation.MemberOf_SubControlArea is 'Substation.MemberOf_SubControlArea';
comment on column Substation.PSRType is 'PowerSystemResource.PSRType';
comment on column Substation.Zones is 'PowerSystemResource.Zones';
comment on column Substation.SubGeographicalRegion is 'PowerSystemResource.SubGeographicalRegion';

create table BaseVoltage
(
ID varchar2(500),
name varchar2(500),
nominalVoltage varchar2(500),
BasePower varchar2(500)
);
comment on column BaseVoltage.name is 'Naming.name';
comment on column BaseVoltage.nominalVoltage is 'BaseVoltage.nominalVoltage';
comment on column BaseVoltage.BasePower is 'BaseVoltage.BasePower';

create table SubControlArea
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
OperatedBy_Companies varchar2(500),
PSRType varchar2(500)
);
comment on column SubControlArea.name is 'Naming.name';
comment on column SubControlArea.description is 'Naming.description';
comment on column SubControlArea.OperatedBy_Companies is 'PowerSystemResource.OperatedBy_Companies';
comment on column SubControlArea.PSRType is 'PowerSystemResource.PSRType';

create table PSRType
(
ID varchar2(500),
name varchar2(500),
description varchar2(500)
);
comment on column PSRType.name is 'Naming.name';
comment on column PSRType.description is 'Naming.description';

create table LinearConductorAssetType
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
ratedCurrent varchar2(500)
);
comment on column LinearConductorAssetType.name is 'Naming.name';
comment on column LinearConductorAssetType.description is 'Naming.description';
comment on column LinearConductorAssetType.r is 'Conductor.r';
comment on column LinearConductorAssetType.x is 'Conductor.x';
comment on column LinearConductorAssetType.bch is 'Conductor.bch';
comment on column LinearConductorAssetType.r0 is 'Conductor.r0';
comment on column LinearConductorAssetType.x0 is 'Conductor.x0';
comment on column LinearConductorAssetType.b0ch is 'Conductor.b0ch';
comment on column LinearConductorAssetType.ratedCurrent is 'LinearConductorAsset.ratedCurrent';

create table TapChanger
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
highStep varchar2(500),
lowStep varchar2(500),
normalStep varchar2(500),
neutralStep varchar2(500),
stepVoltageIncrement varchar2(500),
neutralKV varchar2(500),
TransformerWinding varchar2(500)
);
comment on column TapChanger.name is 'Naming.name';
comment on column TapChanger.description is 'Naming.description';
comment on column TapChanger.highStep is 'TapChanger.highStep';
comment on column TapChanger.lowStep is 'TapChanger.lowStep';
comment on column TapChanger.normalStep is 'TapChanger.normalStep';
comment on column TapChanger.neutralStep is 'TapChanger.neutralStep';
comment on column TapChanger.stepVoltageIncrement is 'TapChanger.stepVoltageIncrement';
comment on column TapChanger.neutralKV is 'TapChanger.neutralKV';
comment on column TapChanger.TransformerWinding is 'TapChanger.TransformerWinding';

create table Unit
(
ID varchar2(500),
name varchar2(500)
);
comment on column Unit.name is 'Naming.name';

create table Bay
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
MemberOf_Substation varchar2(500),
MemberOf_VoltageLevel varchar2(500)
);
comment on column Bay.name is 'Naming.name';
comment on column Bay.description is 'Naming.description';
comment on column Bay.MemberOf_Substation is 'Bay.MemberOf_Substation';
comment on column Bay.MemberOf_VoltageLevel is 'Bay.MemberOf_VoltageLevel';

create table TransformerWinding
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
ratedKV varchar2(500),
ratedMVA varchar2(500),
windingType varchar2(500),
BaseVoltage varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
MemberOf_PowerTransformer varchar2(500),
r varchar2(500),
x varchar2(500),
b varchar2(500),
r0 varchar2(500),
x0 varchar2(500),
grounded varchar2(500),
connectionType varchar2(500),
Terminals varchar2(500)
);
comment on column TransformerWinding.name is 'Naming.name';
comment on column TransformerWinding.description is 'Naming.description';
comment on column TransformerWinding.ratedKV is 'TransformerWinding.ratedKV';
comment on column TransformerWinding.ratedMVA is 'TransformerWinding.ratedMVA';
comment on column TransformerWinding.windingType is 'TransformerWinding.windingType';
comment on column TransformerWinding.BaseVoltage is 'ConductingEquipment.BaseVoltage';
comment on column TransformerWinding.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column TransformerWinding.MemberOf_PowerTransformer is 'TransformerWinding.MemberOf_PowerTransformer';
comment on column TransformerWinding.r is 'TransformerWinding.r';
comment on column TransformerWinding.x is 'TransformerWinding.x';
comment on column TransformerWinding.b is 'TransformerWinding.b';
comment on column TransformerWinding.r0 is 'TransformerWinding.r0';
comment on column TransformerWinding.x0 is 'TransformerWinding.x0';
comment on column TransformerWinding.grounded is 'TransformerWinding.grounded';
comment on column TransformerWinding.connectionType is 'TransformerWinding.connectionType';
comment on column TransformerWinding.Terminals is 'ConductingEquipment.Terminals';

create table MeasurementType
(
ID varchar2(500),
name varchar2(500),
description varchar2(500)
);
comment on column MeasurementType.name is 'Naming.name';
comment on column MeasurementType.description is 'Naming.description';

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

create table Zone
(
ID varchar2(500),
name varchar2(500),
description varchar2(500)
);
comment on column Zone.name is 'Naming.name';
comment on column Zone.description is 'Naming.description';

create table Company
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
pathName varchar2(500)
);
comment on column Company.name is 'Naming.name';
comment on column Company.description is 'Naming.description';
comment on column Company.pathName is 'Naming.pathName';

create table GroundDisconnector
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
normalOpen varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
BaseVoltage varchar2(500),
Zones varchar2(500),
Terminals varchar2(500)
);
comment on column GroundDisconnector.name is 'Naming.name';
comment on column GroundDisconnector.description is 'Naming.description';
comment on column GroundDisconnector.normalOpen is 'Switch.normalOpen';
comment on column GroundDisconnector.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column GroundDisconnector.BaseVoltage is 'ConductingEquipment.BaseVoltage';
comment on column GroundDisconnector.Zones is 'PowerSystemResource.Zones';
comment on column GroundDisconnector.Terminals is 'ConductingEquipment.Terminals';

create table Breaker
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
normalOpen varchar2(500),
ampRating varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
BaseVoltage varchar2(500),
Zones varchar2(500),
Terminals varchar2(500),
Terminals1 varchar2(500)
);
comment on column Breaker.name is 'Naming.name';
comment on column Breaker.description is 'Naming.description';
comment on column Breaker.normalOpen is 'Switch.normalOpen';
comment on column Breaker.ampRating is 'Breaker.ampRating';
comment on column Breaker.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column Breaker.BaseVoltage is 'ConductingEquipment.BaseVoltage';
comment on column Breaker.Zones is 'PowerSystemResource.Zones';
comment on column Breaker.Terminals is 'ConductingEquipment.Terminals';
comment on column Breaker.Terminals1 is 'ConductingEquipment.Terminals';

create table Terminal
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
ConductingEquipment varchar2(500),
ConnectivityNode varchar2(500)
);
comment on column Terminal.name is 'Naming.name';
comment on column Terminal.description is 'Naming.description';
comment on column Terminal.ConductingEquipment is 'Terminal.ConductingEquipment';
comment on column Terminal.ConnectivityNode is 'Terminal.ConnectivityNode';

create table SynchronousMachine
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
xDirectSubtrans varchar2(500),
xDirectTrans varchar2(500),
x0 varchar2(500),
xQuadSync varchar2(500),
inertia varchar2(500),
ratedMVA varchar2(500),
x2 varchar2(500),
minimumOperatingMW varchar2(500),
maximumOperatingMW varchar2(500),
maximumMVAr varchar2(500),
minimumMVAr varchar2(500),
MemberOf_GeneratingUnit varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
Terminals varchar2(500)
);
comment on column SynchronousMachine.name is 'Naming.name';
comment on column SynchronousMachine.description is 'Naming.description';
comment on column SynchronousMachine.xDirectSubtrans is 'SynchronousMachine.xDirectSubtrans';
comment on column SynchronousMachine.xDirectTrans is 'SynchronousMachine.xDirectTrans';
comment on column SynchronousMachine.x0 is 'SynchronousMachine.x0';
comment on column SynchronousMachine.xQuadSync is 'SynchronousMachine.xQuadSync';
comment on column SynchronousMachine.inertia is 'SynchronousMachine.inertia';
comment on column SynchronousMachine.ratedMVA is 'SynchronousMachine.ratedMVA';
comment on column SynchronousMachine.x2 is 'SynchronousMachine.x2';
comment on column SynchronousMachine.minimumOperatingMW is 'SynchronousMachine.minimumOperatingMW';
comment on column SynchronousMachine.maximumOperatingMW is 'SynchronousMachine.maximumOperatingMW';
comment on column SynchronousMachine.maximumMVAr is 'SynchronousMachine.maximumMVAr';
comment on column SynchronousMachine.minimumMVAr is 'SynchronousMachine.minimumMVAr';
comment on column SynchronousMachine.MemberOf_GeneratingUnit is 'SynchronousMachine.MemberOf_GeneratingUnit';
comment on column SynchronousMachine.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column SynchronousMachine.Terminals is 'ConductingEquipment.Terminals';

create table LinearConductorAsset
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
Type varchar2(500),
MemberOfACLine varchar2(500)
);
comment on column LinearConductorAsset.name is 'Naming.name';
comment on column LinearConductorAsset.description is 'Naming.description';
comment on column LinearConductorAsset.r is 'Conductor.r';
comment on column LinearConductorAsset.x is 'Conductor.x';
comment on column LinearConductorAsset.bch is 'Conductor.bch';
comment on column LinearConductorAsset.r0 is 'Conductor.r0';
comment on column LinearConductorAsset.x0 is 'Conductor.x0';
comment on column LinearConductorAsset.b0ch is 'Conductor.b0ch';
comment on column LinearConductorAsset.length is 'Conductor.length';
comment on column LinearConductorAsset.ratedCurrent is 'LinearConductorAsset.ratedCurrent';
comment on column LinearConductorAsset.Type is 'LinearConductorAsset.Type';
comment on column LinearConductorAsset.MemberOfACLine is 'LinearConductorAsset.MemberOfACLine';

create table BusbarSection
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
aliasName varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
PSRType varchar2(500),
Zones varchar2(500),
Terminals varchar2(500)
);
comment on column BusbarSection.name is 'Naming.name';
comment on column BusbarSection.description is 'Naming.description';
comment on column BusbarSection.aliasName is 'Naming.aliasName';
comment on column BusbarSection.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column BusbarSection.PSRType is 'PowerSystemResource.PSRType';
comment on column BusbarSection.Zones is 'PowerSystemResource.Zones';
comment on column BusbarSection.Terminals is 'ConductingEquipment.Terminals';

create table ConnectivityNode
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
MemberOf_EquipmentContainer varchar2(500)
);
comment on column ConnectivityNode.name is 'Naming.name';
comment on column ConnectivityNode.description is 'Naming.description';
comment on column ConnectivityNode.MemberOf_EquipmentContainer is 'ConnectivityNode.MemberOf_EquipmentContainer';

create table ThermalGeneratingUnit
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
minimumOperatingMW varchar2(500),
maximumOperatingMW varchar2(500),
Contains_SynchronousMachines varchar2(500)
);
comment on column ThermalGeneratingUnit.name is 'Naming.name';
comment on column ThermalGeneratingUnit.description is 'Naming.description';
comment on column ThermalGeneratingUnit.minimumOperatingMW is 'GeneratingUnit.minimumOperatingMW';
comment on column ThermalGeneratingUnit.maximumOperatingMW is 'GeneratingUnit.maximumOperatingMW';
comment on column ThermalGeneratingUnit.Contains_SynchronousMachines is 'GeneratingUnit.Contains_SynchronousMachines';

create table PowerTransformer
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
aliasName varchar2(500),
ExcitingCurrent varchar2(500),
NoLoadLoss varchar2(500),
HM_ShortVolt varchar2(500),
ML_ShortVolt varchar2(500),
LH_ShortVolt varchar2(500),
HM_LoadLoss varchar2(500),
ML_LoadLoss varchar2(500),
LH_LoadLoss varchar2(500),
Zones varchar2(500),
MemberOf_EquipmentContainer varchar2(500)
);
comment on column PowerTransformer.name is 'Naming.name';
comment on column PowerTransformer.description is 'Naming.description';
comment on column PowerTransformer.aliasName is 'Naming.aliasName';
comment on column PowerTransformer.ExcitingCurrent is 'PowerTransformer.ExcitingCurrent';
comment on column PowerTransformer.NoLoadLoss is 'PowerTransformer.NoLoadLoss';
comment on column PowerTransformer.HM_ShortVolt is 'PowerTransformer.HM_ShortVolt';
comment on column PowerTransformer.ML_ShortVolt is 'PowerTransformer.ML_ShortVolt';
comment on column PowerTransformer.LH_ShortVolt is 'PowerTransformer.LH_ShortVolt';
comment on column PowerTransformer.HM_LoadLoss is 'PowerTransformer.HM_LoadLoss';
comment on column PowerTransformer.ML_LoadLoss is 'PowerTransformer.ML_LoadLoss';
comment on column PowerTransformer.LH_LoadLoss is 'PowerTransformer.LH_LoadLoss';
comment on column PowerTransformer.Zones is 'PowerSystemResource.Zones';
comment on column PowerTransformer.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';

create table Compensator
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
nominalkV varchar2(500),
r varchar2(500),
x varchar2(500),
nominalMVAr varchar2(500),
mVArPerSection varchar2(500),
maximumSections varchar2(500),
normalSections varchar2(500),
compensatorType varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
Zones varchar2(500),
Terminals varchar2(500),
Terminals1 varchar2(500)
);
comment on column Compensator.name is 'Naming.name';
comment on column Compensator.description is 'Naming.description';
comment on column Compensator.nominalkV is 'Compensator.nominalkV';
comment on column Compensator.r is 'Compensator.r';
comment on column Compensator.x is 'Compensator.x';
comment on column Compensator.nominalMVAr is 'Compensator.nominalMVAr';
comment on column Compensator.mVArPerSection is 'Compensator.mVArPerSection';
comment on column Compensator.maximumSections is 'Compensator.maximumSections';
comment on column Compensator.normalSections is 'Compensator.normalSections';
comment on column Compensator.compensatorType is 'Compensator.compensatorType';
comment on column Compensator.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column Compensator.Zones is 'PowerSystemResource.Zones';
comment on column Compensator.Terminals is 'ConductingEquipment.Terminals';
comment on column Compensator.Terminals1 is 'ConductingEquipment.Terminals';

create table EnergyConsumer
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
PSRType varchar2(500),
Zones varchar2(500),
Terminals varchar2(500)
);
comment on column EnergyConsumer.name is 'Naming.name';
comment on column EnergyConsumer.description is 'Naming.description';
comment on column EnergyConsumer.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column EnergyConsumer.PSRType is 'PowerSystemResource.PSRType';
comment on column EnergyConsumer.Zones is 'PowerSystemResource.Zones';
comment on column EnergyConsumer.Terminals is 'ConductingEquipment.Terminals';

create table VoltageLevel
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
highVoltageLimit varchar2(500),
lowVoltageLimit varchar2(500),
MemberOf_Substation varchar2(500),
BaseVoltage varchar2(500)
);
comment on column VoltageLevel.name is 'Naming.name';
comment on column VoltageLevel.description is 'Naming.description';
comment on column VoltageLevel.highVoltageLimit is 'VoltageLevel.highVoltageLimit';
comment on column VoltageLevel.lowVoltageLimit is 'VoltageLevel.lowVoltageLimit';
comment on column VoltageLevel.MemberOf_Substation is 'VoltageLevel.MemberOf_Substation';
comment on column VoltageLevel.BaseVoltage is 'VoltageLevel.BaseVoltage';

create table SubGeographicalRegion
(
ID varchar2(500),
name varchar2(500),
description varchar2(500)
);
comment on column SubGeographicalRegion.name is 'Naming.name';
comment on column SubGeographicalRegion.description is 'Naming.description';

create table Disconnector
(
ID varchar2(500),
name varchar2(500),
description varchar2(500),
normalOpen varchar2(500),
MemberOf_EquipmentContainer varchar2(500),
BaseVoltage varchar2(500),
Zones varchar2(500),
Terminals varchar2(500),
Terminals1 varchar2(500)
);
comment on column Disconnector.name is 'Naming.name';
comment on column Disconnector.description is 'Naming.description';
comment on column Disconnector.normalOpen is 'Switch.normalOpen';
comment on column Disconnector.MemberOf_EquipmentContainer is 'Equipment.MemberOf_EquipmentContainer';
comment on column Disconnector.BaseVoltage is 'ConductingEquipment.BaseVoltage';
comment on column Disconnector.Zones is 'PowerSystemResource.Zones';
comment on column Disconnector.Terminals is 'ConductingEquipment.Terminals';
comment on column Disconnector.Terminals1 is 'ConductingEquipment.Terminals';

create table Line
(
ID varchar2(500),
name varchar2(500),
description varchar2(500)
);
comment on column Line.name is 'Naming.name';
comment on column Line.description is 'Naming.description';

create table BasePower
(
ID varchar2(500),
basePower varchar2(500),
BaseVoltage varchar2(500),
BaseVoltage1 varchar2(500),
BaseVoltage2 varchar2(500),
BaseVoltage3 varchar2(500),
BaseVoltage4 varchar2(500),
BaseVoltage5 varchar2(500),
BaseVoltage6 varchar2(500),
BaseVoltage7 varchar2(500),
BaseVoltage8 varchar2(500),
BaseVoltage9 varchar2(500),
BaseVoltage10 varchar2(500),
BaseVoltage11 varchar2(500),
BaseVoltage12 varchar2(500),
BaseVoltage13 varchar2(500),
BaseVoltage14 varchar2(500),
BaseVoltage15 varchar2(500),
BaseVoltage16 varchar2(500),
BaseVoltage17 varchar2(500),
BaseVoltage18 varchar2(500),
BaseVoltage19 varchar2(500)
);
comment on column BasePower.basePower is 'BasePower.basePower';
comment on column BasePower.BaseVoltage is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage1 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage2 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage3 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage4 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage5 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage6 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage7 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage8 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage9 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage10 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage11 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage12 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage13 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage14 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage15 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage16 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage17 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage18 is 'BasePower.BaseVoltage';
comment on column BasePower.BaseVoltage19 is 'BasePower.BaseVoltage';

