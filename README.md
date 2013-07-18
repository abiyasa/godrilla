# GODRILLA
An arkanoid game with a godzilla bouncing a (fire)ball destroying the city building. This is an experiment using Starling and the latest release of Robotlegs 2.0.

![Screen shots of Godrilla](http://abiyasa.com/lab/starling/godrilla/screen01.png "Screenshot")

## Online Demo
Play it at http://abiyasa.com/lab/starling/godrilla/

## Libraries
- Starling 1.3
- Robotlegs 2.0.0
- [Robotlegs Starling View Map extension](https://github.com/jamieowen/robotlegs2-starling-viewmap) by Jamie Owen

## Compilation
- Use Flash Develop
- Targeted to Flash Player 11.3
- Tested on Flash/Flex SDK 4.6
- Include all swc from `libs/` and all classes from `lib/robotlegs2-starling-viewmap`

## Git clone
If you clone this project from a Git repo, please do `git submodule init` and `git submodule update` after cloning
the project for the first time. This is for getting the Robotlegs Starling View Map extension from GitHub

## Assets
- Skycrapper textures by [hc](http://opengameart.org/node/8816) with some modifications
- Godzilla textures by [~BLZofOZZ](http://browse.deviantart.com/art/Godzilla-Dominations-II-260585747) with some modifications

# Implemented features
- Use sprite for paddle and buildings
- Buildings which will be destroyed and bounce back the ball
- Simple start screen

# What can be optimized
- Use texture atlas for combining all sprites into 1 texture for less Starling drawing
- Improve the ball bouncing on paddle, bounce different angle based on which part of the paddle the ball hits

## License
Godrilla

Author: I. Abiyasa Suhardi (2013)

http://www.abiyasa.com

Licence Agreement (The MIT License)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
