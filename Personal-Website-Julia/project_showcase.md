@def title = "Katherine Gruenewald - Animations"
@def hasmath = false
@def hascode = true


\newcommand{\mtt}[2]{
  ~~~
<figure style="text-align:center;border: thin silver solid;max-width: 80%;">
<img src="!#1" style="width:100%;">
<figcaption>#2
</figure>
~~~
}

# Gallery

Various visualizations for some projects I have worked on since 2020. Enjoy!

## Server-side tic-tac-toe!

You can play server-side tic-tac-toe [here](www.kathesch.com/tictactoe)! Uses htmx and oxygen.jl

## Calculator
I used a [shift-reduce parser](https://en.wikipedia.org/wiki/Shift-reduce_parser) to mostly learn how to make one, but also to avoid using Javascript's infamous eval function which is both slow (not compiled) and a potential security vulnerability. You can see the source code on my [github](https://github.com/kathesch/calculator). 
~~~
<iframe src="../calculator/index.html" scrolling="no" style="min-height: 80vh; min-width: 50vw; border:none"></iframe>
~~~

## Etch-a-sketch
A Javascript learning project. Just doodle!
~~~
<iframe src="../etchsketch/index.html" scrolling="no" style="min-height: 80vh; min-width: 50vw; border: none;"></iframe>
~~~

## Error and sensitivity of single steps of ODE solvers

\mtt{/assets/IMEX_demo.gif}{Uses DifferentialEquations.jl to plot single steps of any ODE solver in DifferentialEquations.jl. You can see how the ODE solver introduces error by "jumping" to adjacent integral curves of the exact solution of the differential equation.}.

## Finite difference solver for the Navier-Stokes equation 

\mtt{/assets/flowcrop2.gif}{A coupled flow for the incompressible, viscous navier-stokes equation. You can view the course code on my <a href="[url](https://github.com/kathesch/FiniteDifferenceFlowDemo.jl)">github</a>}.

## Fast poisson solver using the Euler-Poisson-Darboux Equation

\mtt{/assets/plot_676.gif}{We can see the Euler-Poisson-Darboux (EPD) equation is able to find the "steady state" faster than the heat equation. Closely related to <a href="[url](https://en.wikipedia.org/wiki/Gossip_protocol)">gossip problem</a> in computer science or more generally solving elliptic PDEs numerically quickly.}

## Ellipsoidal Earth with trajectory animation

\mtt{/assets/earth_spin.gif}{Trajectory of a rocket from GPS time series data projected accurately onto as WSG84 model of the Earth.}

## Interactive stress-strain curve

We can model a simple polymer material with molecular dynamics and interactively output coordinates to Makie. 


\mtt{/assets/nvearinter.gif}{Figure 1: Basic initialization}

 
\mtt{/assets/stretchpolymer.gif}{Figure 2: Stretching}
\mtt{/assets/compresspolymer.gif}{Figure 3: Compression}

## Ray tracer

\mtt{/assets/renderbest.png}{Ray tracer implemented in Julia using Peter Shirley’s book "Ray Tracing in One Weekend".}

## Bee swarm image interpolation and modal analysis

\mtt{/assets/beeeinterpolation.gif}{Figure 1: Image analysis fitting a video of a bee swarm scattering to a 3D model.}

\mtt{/assets/beeeigenmodes.gif}{Figure 2: Computing vibrational modes of a bee swarm model ordered by energy (lowest to highest). }


## Lotka-Volterra network modelling

\mtt{/assets/biomassflowlabeled.gif}{Figure 1: Simple graphic showing flow of biomass in a lotka-voltera network}

\mtt{/assets/biomassflownetwork.gif}{Figure 2: Biomass flow in a more complicated lotka-voltera network}

\mtt{/assets/neuralnet.gif}{Figure 3: Neural network controlling one organism's population to prevent extinction of organisms in other nodes of the network. }

<!-->
## Eigenmodes of vibrations for simple geometries

\mtt{/assets/lowest.gif}{Figure 1: Lowest order vibrational modes for a 2d plane bounded at its edges.}

\mtt{/assets/2ndeigenmode.gif}{Figure 2: 2nd lowest vibrational mode for the above plane.}

\mtt{/assets/3deigen.gif}{Figure 3: A volumetric vibrational mode in a cube.}
-->

<!--
# Code generation

**Note: this feature is experimental and the API might change frequently**

`toexpr(ex)` turns any expression (`ex`) into the equivalent `Expr` which is suitable for `eval`. The `SymbolicUtils.Code` module provides some combinators which provides the ability to construct more complex expressions than just function calls. These include:



- Let blocks
- Functions with arguments and keyword arguments
  - Functions with arguments which are to be de-structured
- Expressions that set array elements in-place
- Expressions that create an array similar in type to a reference array (currently supports `Array`, `StaticArrays.SArray`, and `LabelledArrays.SLArray`)
- Expressions that create sparse arrays

**Do `using SymbolicUtils.Code` to get the following bindings**

## `toexpr`

{{doc toexpr toexpr fn Code}}

## Code Combinators

These are all exported when you do `using SymbolicUtils.Code`

{{doc Assignment Assignment type Code}}

{{doc Let Let type Code}}

{{doc Func Func type Code}}

{{doc SpawnFetch SpawnFetch type Code}}

{{doc SetArray SetArray type Code}}

{{doc MakeArray MakeArray type Code}}

{{doc MakeSparseArray MakeSparseArray type Code}}

{{doc MakeTuple MakeTuple type Code}}

{{doc LiteralExpr LiteralExpr type Code}}
-->