/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2025 François Serre (serref@inf.ethz.ch)
 * /____/\____/\___/_/ /_/  https://github.com/fserre/sgen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software Foundation,
 * Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 */
import sbtassembly.AssemblyPlugin.{defaultShellScript, defaultUniversalScript}

lazy val SimTest = config("sim") extend Test // Tests that generate a testbench, that will be run by the CICD pipeline
lazy val SynthTest = config("synth") extend Test // Tests that generate designs for synthesis, that will be run by the CICD pipeline to check for regression
lazy val RegularTest = config("regular") extend Test // Regular unit tests
lazy val PublishTest = config("publish") extend Test // Tests that generate designs used for publication (website)

lazy val root = (project in file("."))
  .configs(SimTest, RegularTest, SynthTest, PublishTest)
  .enablePlugins(BuildInfoPlugin)
  .settings(
    name := "SGen",
    organization := "fserre",
    version := {
      val today = java.time.LocalDate.now()
      s"${today.getYear % 100}.${today.getMonthValue}.${today.getDayOfMonth}"
    },
    scalaVersion := "3.7.3",
    buildInfoKeys := Seq[BuildInfoKey](name, version, scalaVersion, sbtVersion),
    inConfig(SimTest)(Defaults.testTasks),
    inConfig(SynthTest)(Defaults.testTasks),
    inConfig(RegularTest)(Defaults.testTasks),
    inConfig(PublishTest)(Defaults.testTasks),
    libraryDependencies += "org.scalatest" %% "scalatest" % "3.2.19" % Test,
    libraryDependencies += "org.scala-lang.modules" %% "scala-parallel-collections" % "1.2.0" % Test,
    scalacOptions ++= Seq("-deprecation","-feature","-explain", "-release", "8"),
    javacOptions ++= Seq("-source", "8", "-target", "8"),
    Compile / run / mainClass := Some("Main"),
    assembly / mainClass := Some("Main"),
    assembly / assemblyJarName := "sgen.bat",
    assembly / assemblyOutputPath := baseDirectory.value / "sgen.bat",
    assembly / assemblyPrependShellScript := Some(defaultUniversalScript(shebang = false)),
    fork := true,
    RegularTest / testOptions += Tests.Argument("-l", "simulation", "-l", "synthesis", "-l", "publish"),
    SimTest / testOptions += Tests.Argument("-n", "simulation"),
    SynthTest / testOptions += Tests.Argument("-n", "synthesis"),
    PublishTest / testOptions += Tests.Argument("-n", "publish")
  )

