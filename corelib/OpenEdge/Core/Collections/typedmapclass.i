&if 1=0 &then
/************************************************
Copyright (c)  2014 by Progress Software Corporation. All rights reserved.
*************************************************/
/*------------------------------------------------------------------------
    File        : OpenEdge/Core/Collections/typedmapclass.i
    Purpose     : Include allowing us to workaround the lack of generics in ABL  
    Author(s)   : 
    Created     : Wed Dec 11 14:16:42 EST 2013
    Notes       : * Arguments:
                        Package     : The package name for this class (excludes class)
                        MapType     : The class name only for this type (excludes package).
                        KeyType     : The type (class or interface) to be used for the Map's key. Depending on
                                      containing class, can take advantage of USING.   
                        ValueType   : The type (class or interface) to be used for the Map's value. Depending on
                                      containing class, can take advantage of USING.
                        NoEndClass  : Passed if the containing class has additional methods to be added. 
                                      If specified, the containing class must
                        (opt) ParentCollectionType: The type of the parent collection. Defaults to the Map class.                                       
                  * Usage example: the below creates a collection 
                        {OpenEdge/Core/Collections/typedmapclass.i
                            &Package   = OpenEdge.InjectABL.Binding.Modules
                            &MapType   = IInjectionModuleCollection
                            &KeyType   = OpenEdge.Core.String
                            &ValueType = OpenEdge.InjectABL.Binding.Modules.IInjectionModule}
  ----------------------------------------------------------------------*/
&endif  
&if defined(Package) eq 0 &then
    &scoped-define Package  
    &scoped-define FullType {&MapType} 
&elseif defined(Package) gt 0 &then
    &if length(trim("{&Package}")) eq  0 &then
        &scoped-define FullType {&MapType}
    &else
        &if substring("{&Package}", length("{&Package}"), 1) eq '.' &then
            &scoped-define FullType {&Package}{&MapType}
        &else
            &scoped-define FullType {&Package}.{&MapType}
        &endif
    &endif                
&endif

&if defined(ParentCollectionType) eq 0 &then
    &scoped-define ParentCollectionType OpenEdge.Core.Collections.Map
&endif

&if defined(ImplementsType) gt 0 &then
    &scoped-define Interfaces implements {&ImplementsType}
&else
    &scoped-define ImplementsType OpenEdge.Core.Collections.IMap
&endif
    
&if defined(IsSerializable) &then
&if keyword-all('serializable') eq 'serializable' &then
    &scoped-define serializable serializable
&endif 
&endif

class {&FullType} {&serializable} inherits {&ParentCollectionType} {&Interfaces}:
    constructor public {&MapType}(input poMap as {&ImplementsType}):
        super(poMap).
    end constructor.
    
    constructor public {&MapType}():
        super().
    end constructor.
    
    /* Associates the specified value with the specified key in this map (optional operation).*/
    method public {&ValueType} Put(input poKey as {&KeyType}, input poValue as {&ValueType}):
        &if '{&ValueType}' ne 'Object' and '{&ValueType}' ne 'Progress.Lang.Object' &then
        OpenEdge.Core.Assert:IsType(poValue,  get-class({&ValueType})).
        return cast(super:Put(poKey, poValue), {&ValueType}).
        &else
        return super:Put(poKey, poValue).
        &endif
    end method.
    
    method override public Progress.Lang.Object Put(input poKey as Progress.Lang.Object, input poValue as Progress.Lang.Object):
        OpenEdge.Core.Assert:IsType(poKey,  get-class({&KeyType})).
        
        &if '{&ValueType}' ne 'Object' and '{&ValueType}' ne 'Progress.Lang.Object' &then
        OpenEdge.Core.Assert:IsType(poValue,  get-class({&ValueType})).
        return cast(super:Put(poKey, poValue), {&ValueType}).
        &else
        return super:Put(poKey, poValue).
        &endif
    end method.
    
    /* Removes the mapping for this key from this map if it is present (optional operation).*/
    method public {&ValueType} Remove(input poKey as {&KeyType}):
        &if '{&ValueType}' ne 'Object' and '{&ValueType}' ne 'Progress.Lang.Object' &then
        return cast(super:Remove(poKey), {&ValueType}).
        &else
        return super:Remove(poKey).
        &endif
    end method.

    /* Removes the mapping for this key from this map if it is present (optional operation).*/
    method override public Progress.Lang.Object Remove(input poKey as Progress.Lang.Object):
        OpenEdge.Core.Assert:IsType(poKey,  get-class({&KeyType})).
        &if '{&ValueType}' ne 'Object' and '{&ValueType}' ne 'Progress.Lang.Object' &then
        return cast(super:Remove(poKey), {&ValueType}).
        &else
        return super:Remove(poKey).
        &endif
    end method.
    
    &if '{&ParentCollectionType}' eq 'OpenEdge.Core.Collections.Map' and 
        '{&KeyType}' ne 'Object' and '{&KeyType}' ne 'Progress.Lang.Object' &then
    /* Returns true if this map contains a mapping for the specified key. */
    method override public logical ContainsKey(input poKey as Progress.Lang.Object):
        OpenEdge.Core.Assert:IsType(poKey,  get-class({&KeyType})).
        return super:ContainsKey(poKey).
    end method.
    
    /* Returns true if this map contains a mapping for the specified key. */
    method public logical ContainsKey(input poKey as {&KeyType}):
        return super:ContainsKey(poKey).
    end method.
    &endif
    
    &if '{&ParentCollectionType}' eq 'OpenEdge.Core.Collections.Map' and 
        '{&ValueType}' ne 'Object' and '{&ValueType}' ne 'Progress.Lang.Object' &then
    /* Returns true if this map maps one or more keys to the specified value.*/
    method override public logical ContainsValue(input poValue as Progress.Lang.Object):
        OpenEdge.Core.Assert:IsType(poValue,  get-class({&ValueType})).
        return super:ContainsValue(poValue).
    end method.
    
    /* Returns true if this map maps one or more keys to the specified value.*/
    method public logical ContainsValue(input poValue as {&ValueType}):
        return super:ContainsValue(poValue).
    end method.
    &endif
       
    &if '{&ParentCollectionType}' eq 'OpenEdge.Core.Collections.Map' and 
        '{&KeyType}' ne 'Object' and '{&KeyType}' ne 'Progress.Lang.Object' &then
    /* Returns the value to which this map maps the specified key.*/
    method override public Progress.Lang.Object Get(input poKey as Progress.Lang.Object):
        OpenEdge.Core.Assert:IsType(poKey,  get-class({&KeyType})).

        &if '{&ValueType}' ne 'Object' and '{&ValueType}' ne 'Progress.Lang.Object' &then
        return cast(super:Get(poKey), {&ValueType}).
        &else
        return super:Get(poKey).
        &endif
    end method.
    
    /* Returns the value to which this map maps the specified key.*/
    method public {&ValueType} Get(input poKey as {&KeyType}):
        &if '{&ValueType}' ne 'Object' and '{&ValueType}' ne 'Progress.Lang.Object' &then
        return cast(super:Get(poKey), {&ValueType}).
        &else
        return super:Get(poKey).
        &endif
    end method.
    &endif 

    &if defined(Interfaces) gt 0 &then
    method public void PutAll(input poMap as {&ImplementsType}):
        super:PutAll(poMap).
    end method.
    
    method override public void PutAll(input poMap as OpenEdge.Core.Collections.IMap):
        OpenEdge.Core.Assert:IsType(poMap, get-class({&ImplementsType})).
        super:PutAll(poMap).
    end method.
    &endif
&if defined(NoEndClass) eq 0 &then     
end class. 
&endif 
