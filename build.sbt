/**
 * Streaming Hardware Generator - ETH Zurich
 * Copyright (C) 2015 Francois Serre (serref@inf.ethz.ch)
 */

name := "SGen"
organization := "fserre"
version := "0.1"
scalaVersion := "2.13.3"
mainClass in (Compile, run) := Some("main")

//libraryDependencies += "org.scalatest" % "scalatest_2.13" % "3.0.8" % "test"
libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.2" % "test"
libraryDependencies += "org.scalacheck" %% "scalacheck" % "1.14.1" % "test"

parallelExecution in Test := false