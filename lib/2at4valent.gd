#############################################################################
##
#W    utils.gd    GRaphs with SYmmetries library       Rhys J. Evans
##                                                           Primož Potočnik
##                                                           Antonio Montero
##
#Y  Copyright (C) 2024
##
##  Declaration file for functions that access the 2-arc-transitive 4-valent
##  graphs. 
##

######################
## GLOBAL VARIABLES ##
######################

#############################################################################
##
#V  2AT_4VALENT_ORDER_MAX  
##
##  <#GAPDoc Label="2AT_4VALENT_ORDER_MAX">
##  <ManSection>
##  <Var Name="2AT_4VALENT_ORDER_MAX"/>
##
##  <Description>
##  This variable stores the largest value <M>n</M> for which the current 
##  package contains all arc-transitive 2-valent digraphs with at most <M>n</M> 
##  vertices. The number of arc-transitive 2-valent digraphs stored for each 
##  <M>n</M> is stored in the list <Ref Var="2AT_4VALENT_NUMBERS"/>. This variable
##  is currently set to 1000. 
##    <Example>
##      <![CDATA[
##gap> 2AT_4VALENT_ORDER_MAX;
##640
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##

#############################################################################
##
#V  2AT_4VALENT_NUMBERS  
##
##  <#GAPDoc Label="2AT_4VALENT_NUMBERS">
##  <ManSection>
##  <Var Name="2AT_4VALENT_NUMBERS"/>
##
##  <Description>
##  This variable stores the number of arc-transitive 2-valent digraphs stored
##  in this package
##  <P/>
##  For a positive integer <M>n</M>, <C>2AT_4VALENT_NUMBERS[</C><M>n</M><C>]</C> is the
##  number of arc-transitive 2-valent graphs available in this package.
##    <Example>
##      <![CDATA[
##gap> 2AT_4VALENT_NUMBERS[200];  
##40
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalVariable("2AT_4VALENT_NUMBERS","Number of arc-transitive 2-valent digraphs stored");

######################
## GLOBAL FUNCTIONS ##
######################

################################################################################
##
#A  IdOf2AT4ValentGraph( <digraph> )
##  
##  <#GAPDoc Label="IdOf2AT4ValentGraph">
##  <ManSection>
##  <Attr Name="IdOf2AT4ValentGraph"
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
##   be the <C>i</C>th entry of <C>All2AT4ValentGraphs(n)</C> and the <C>i</C>th 
##  graph found when iterating through <C>IteratorOf2AT4ValentGraphs(n)</C>.
##    <Example>
##      <![CDATA[
##gap> gamma:=2AT4ValentGraph(200,2);;
##gap> IdOf2AT4ValentGraph(gamma);
##2
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareAttribute( "IdOf2AT4ValentGraph", IsDigraph );

################################################################################
##
#F  Set2AT4ValentGraphPropsNC( <digraph>, <integer>, <integer> )
##  
##  <#GAPDoc Label="Set2AT4ValentGraphPropsNC">
##  <ManSection>
##  <Func Name="Set2AT4ValentGraphPropsNC"
##   Arg='gamma,n,i'/>
##  <Returns></Returns>
##	
##  <Description>
##  Given a digraph <A>gamma</A>, this function sets the properties and 
##  attributes of <A>gamma</A>.
#
##  The
##  properties and attribute set are the same as by the function 
##  <Ref Func="Set2AT4ValentGraphProps"/>. 
##    <Example>
##      <![CDATA[
##gap> gamma:=2AT4ValentGraph(200,10);;
##gap> Set2AT4ValentGraphPropsNC(gamma,200,10);
##gap> IdO2AT4ValentGraph(gamma);
##10
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Set2AT4ValentGraphPropsNC" );

################################################################################
##
#F  Set2AT4ValentGraphProps( <digraph> )
##  
##  <#GAPDoc Label="Set2AT4ValentGraphProps">
##  <ManSection>
##  <Func Name="Set2AT4ValentGraphProps"
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
DeclareGlobalFunction( "Set2AT4ValentGraphProps" );

################################################################################
##
#F  Nr2AT4ValentGraphs( <integer> )
#F  Number2AT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="Nr2AT4ValentGraphs">
##  <ManSection>
##  <Func Name="Nr2AT4ValentGraphs"
##   Arg='n'/>
##  <Func Name="Number2AT4ValentGraphs"
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
##gap> Nr2AT4ValentGraphs(200);
##40
##      ]]>
##    </Example>
##  </Description>
##  </ManSection>
##  <#/GAPDoc>
##
DeclareGlobalFunction( "Nr2AT4ValentGraphs" );
DeclareSynonym( "Number2AT4ValentGraphs", Nr2AT4ValentGraphs);

################################################################################
##
#F  2AT_4VALENT_Filename( <integer> )
##  
DeclareGlobalFunction( "2AT_4VALENT_Filename" );

#############################################################################
##
#F  2AT4ValentGraph( <integer> , <integer>[, <bool>] )
##  
##  <#GAPDoc Label="2AT4ValentGraph">
##  <ManSection>
##  <Func Name="2AT4ValentGraph"
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
##  and attributes from <Ref Func="Set2AT4ValentGraphProps"/>. If 
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
DeclareGlobalFunction( "2AT4ValentGraph" );

#############################################################################
##
#F  All2AT4ValentGraphs( <integer>[, <bool>] )
##  
##  <#GAPDoc Label="All2AT4ValentGraphs">
##  <ManSection>
##  <Func Name="All2AT4ValentGraphs"
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
##  and attributes from <Ref Func="Set2AT4ValentGraphProps"/>. If 
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
DeclareGlobalFunction( "All2AT4ValentGraphs" );

#############################################################################
##
#F  IteratorOf2AT4ValentGraphs( <integer> )
##  
##  <#GAPDoc Label="IteratorOf2AT4ValentGraphs">
##  <ManSection>
##  <Func Name="IteratorOf2AT4ValentGraphs"
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
##  and attributes from <Ref Func="Set2AT4ValentGraphProps"/>. If 
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
DeclareGlobalFunction( "IteratorOf2AT4ValentGraphs" );

#############################################################################
##
#E

