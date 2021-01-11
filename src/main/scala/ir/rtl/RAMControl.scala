/*
 *    _____ ______          SGen - A Generator of Streaming Hardware
 *   / ___// ____/__  ____  Department of Computer Science, ETH Zurich, Switzerland
 *   \__ \/ / __/ _ \/ __ \
 *  ___/ / /_/ /  __/ / / / Copyright (C) 2020-2021 François Serre (serref@inf.ethz.ch)
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

package ir.rtl


/**
 * Defines the method used to control memory banks within temporal permutations
 */
enum RAMControl{
  case Dual /// Read and write addresses are computed independently. This offers the highest flexibility (a dataset can be input at any time after a previous one), but this uses more resources.
  case Single /// Write address is the same as the read address, delayed by a constant time. This uses less resources, but it has less flexibility: a dataset must be input either immediately after the previous one, or wait that the previous dataset is completely out.
  case SinglePorted /// Write and read addresses are the same (single-ported memory). This has the same constraints as Single, but may have a higher latency.
}
