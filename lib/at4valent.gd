#############################################################################
##
#W    utils.gd    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the arc-transitive 4-valent
##  graphs. 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  AT_4VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="AT_4VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="AT_4VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all arc-transitive 2-valent digraphs with at most <M>n</M> 
##  vertices. The number of arc-transitive 2-valent digraphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="AT_4VALENT_NUMBERS"/>. This variable
##  is currently set to 1000. 
##    <Example>
##      <![CDATA[
##gap> AT_4VALENT_ORDER_MAX;
##640
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  AT_4VALENT_NUMBERS  
##
##  <#GAPDoc Label="AT_4VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="AT_4VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of arc-transitive 2-valent digraphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>AT_4VALENT_NUMBERS[</C><M>n</M><C>]</C> is the
##  number of arc-transitive 2-valent graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> AT_4VALENT_NUMBERS[200];  
##40
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("AT_4VALENT_NUMBERS","Number of arc-transitive 2-valent digraphs stored");

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOfAT4ValentGraph( <digraph> )
##  
##  <#GAPDoc Label="IdOfAT4ValentGraph">
##  <ManSection>
##  <Attr Name="IdOfAT4ValentGraph"
##   Arg='gamma'/>
##  <Returns>An integer</Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if <A>gamma</A> is isomorphic to a graph 
##  stored in this package, this function returns the index of the graph 
##  isomorphic to <A>gamma</A>. Otherwise, this function returns <K>fail</K>.
##  <P/>
##  The index <C>i</C> of a graph <C>gamma</C> in this library is the position 
##  at which the graph is stored relative to its number of vertices. 
##  In particular, if <C>gamma</C> has <C>n</C> vertices, then <C>gamma</C> will
##   be the <C>i</C>th entry of <C>AllAT4ValentGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOfAT4ValentGraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=AT4ValentGraph(200,2);;
##gap> IdOfAT4ValentGraph(gamma);
##2
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOfAT4ValentGraph", IsDigraph );

################################################################################
##
#F  SetAT4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="SetAT4ValentGraphPropsNC">
##  <ManSection>
##  <Func Name="SetAT4ValentGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A>.
#
##  The
##  properties and attribute set are the same as by the function 
##  <Ref Func="SetAT4ValentGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=AT4ValentGraph(200,10);;
##gap> SetAT4ValentGraphPropsNC(gamma,200,10);
##gap> IdOAT4ValentGraph(gamma);
##10
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetAT4ValentGraphPropsNC" );

################################################################################
##
#F  SetAT4ValentGraphProps( <digraph> )
##  
##  <#GAPDoc Label="SetAT4ValentGraphProps">
##  <ManSection>
##  <Func Name="SetAT4ValentGraphProps"
##   Arg='gamma'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, if this graph is isomorphic to a graph 
##  stored in this library, this function sets the properties and 
##  attributes of <A>gamma</A> precomputed in this package.
##    <Example>
##      <![CDATA[
##gap> TODO
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "SetAT4ValentGraphProps" );

################################################################################
##
#F  NrAT4ValentGraphs( <integer> )
#F  NumberAT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="NrAT4ValentGraphs">
##  <ManSection>
##  <Func Name="NrAT4ValentGraphs"
##   Arg='n'/>
##  <Func Name="NumberAT4ValentGraphs"
##   Arg='n' Label="long synonym"/>
##  <Returns>An integer</Returns>
##	
##  <Description>
##  Given a positive integer <A>n</A>, this function returns the number of 
##  arc-transitive 2-valent digraphs with <A>n</A> vertices stored in this 
##  package.
##  <P/>
##  For any positive integers <M>n</M> up to 1000, the current package stores
##  all arc-transitive 2-valent digraphs with <M>n</M> vertices.
##    <Example>
##      <![CDATA[
##gap> NrAT4ValentGraphs(200);
##40
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "NrAT4ValentGraphs" );
DeclareSynonym( "NumberAT4ValentGraphs", NrAT4ValentGraphs);

################################################################################
##
#F  AT_4VALENT_Filename( <integer> )
##  
DeclareGlobalFunction( "AT_4VALENT_Filename" );

#############################################################################
##
#F  AT4ValentGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AT4ValentGraph">
##  <ManSection>
##  <Func Name="AT4ValentGraph"
##   Arg='n,i[, data]'/>
##  <Returns>A digraph.</Returns>
##
##  <Description>
##  Given positive integers <A>n,i</A>, this function returns the <A>i</A>th 
##  arc-transitive 2-valent digraph with <A>n</A> vertices available in this 
##  package. If there is no such graph, the function returns <K>fail</K>. 
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graph 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graph.
##    <Example>
##      <![CDATA[
##gap> TODO
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AT4ValentGraph" );

#############################################################################
##
#F  AllAT4ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="AllAT4ValentGraphs">
##  <ManSection>
##  <Func Name="AllAT4ValentGraphs"
##   Arg='n[, data]'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns a list containing
##  all arc-transitive digraphs with <A>n</A> vertices available in this 
##  package. If there are no such graphs, the function returns <K>fail</K>.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> TODO
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "AllAT4ValentGraphs" );

#############################################################################
##
#F  IteratorOfAT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="IteratorOfAT4ValentGraphs">
##  <ManSection>
##  <Func Name="IteratorOfAT4ValentGraphs"
##   Arg='n'/>
##  <Returns>A list</Returns>
##
##  <Description>
##  Given a positive integer <A>n</A>, this function returns an iterator over
##  all arc-transitive 2-valent digraphs with <A>n</A> vertices available in this 
##  package. If there are such no graphs, the function returns an empty iterator.
##  <P/> 
##  When the optional argument <A>data</A> is specified, it must have value 
##  <K>true</K> or <K>false</K>. If <C><A>data</A>=</C><K>true</K>, the graphs 
##  returned by this function will have been assigned the precomputed properties
##  and attributes from <Ref Func="SetAT4ValentGraphProps"/>. If 
##  <C><A>data</A>=</C><K>false</K> or not specified, none of these properties 
##  or attributes are given to the resulting graphs.
##    <Example>
##      <![CDATA[
##gap> TODO
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "IteratorOfAT4ValentGraphs" );

#############################################################################
##
#E

