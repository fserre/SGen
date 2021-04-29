/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020 François Serre (serref@inf.ethz.ch)
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

lazy val root = (project in file("."))
  .settings(
    name := "SGen",
    organization := "fserre",
    version := "0.2",
    scalaVersion := "3.0.1-RC1-bin-20210428-2d2038e-NIGHTLY",
    libraryDependencies += ("org.scalacheck" %% "scalacheck" % "1.15.3" % "test").cross(CrossVersion.for3Use2_13),
    libraryDependencies += ("org.scala-lang.modules" %% "scala-parallel-collections" % "1.0.2").cross(CrossVersion.for3Use2_13),
    scalacOptions ++= Seq("-deprecation","-feature"),
    Compile / run / mainClass := Some("Main"),
    fork := true,
    Test / parallelExecution := false,
    Test / testOptions +=Tests.Argument("-s","100"),
  )

