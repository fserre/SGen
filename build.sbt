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

//scalacOptions ++=  Seq("-doc-root-content", file("rootdoc.txt").getAbsolutePath)
lazy val root = (project in file("."))
  .settings(
    name := "SGen",
    organization := "fserre",
    version := "0.2",
    //scalaVersion := "3.0.0-RC1-bin-20210122-6947b0f-NIGHTLY",
    scalaVersion := "3.0.0-RC1-bin-20210123-b731573-NIGHTLY",
    libraryDependencies += ("org.scalacheck" %% "scalacheck" % "1.15.2" % "test").withDottyCompat(scalaVersion.value),
    scalacOptions ++= Seq("-deprecation","-feature"),
    //scalacOptions ++= Seq("-source","3.1"),
    mainClass in (Compile, run) := Some("Main"),
    parallelExecution in Test := false,
    testOptions in Test +=Tests.Argument("-s","100"),
    //scalacOptions ++= Seq("-indent","-rewrite")
    javaOptions in run ++= Seq("-Xms256M", "-Xmx2G", "-XX:MaxPermSize=1024M", "-XX:+UseConcMarkSweepGC")
  )

