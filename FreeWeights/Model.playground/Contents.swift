//: Playground - noun: a place where people can play

import UIKit

class Day {
    
}

//: Represents a _training variable_
//: Composite of progressions for individuals exercises
class TrainingVariable {
    
}

class WeightTrainingVariable: TrainingVariable {
    
}

class RepTrainingVariable: TrainingVariable {
    
}

class SetTrainingVariable: TrainingVariable {
    
}

// A variable missing here is the frequency of execution of the exercise the variable parameterises
// indeed this is a data of the routine and changes when the routine changes.
// It's evolution wouldn't be as frequent as other variables'.

// Progressions represent the evolution a training variable
// Progression happens when a workout is complete and when certain conditions are met
// For example simply meeting the required weight/reps/sets.
// This could also include doing the workout in a timely manner.

// By completeness we can conceive of training constants
// For example in starting strength the exercises (when we are not in effect switch programs) are constants
// Same with the reps and sets, the only training variable in the weight and the evolution of the exercises.

// Example of execution training variables are the shifts in deadlifting frequency when the weight is important enough
// Oh ! This is an example of a training variable decreasing !

// This a limited example of periodic progressions. Variables evolve in waves but in the long run they do increasecf

// Idea : persist the workouts and training programs ! It doesn't make sense anyway for training programs to
// change retroactively


// This could be our root object
class Training {
    var variables: [TrainingVariable] = []
}

struct Exercise {
    var name: String
}

struct Set {
    var reps = 5
    var exercise: Exercise
}

struct StraightSet {
    var sets = 5
    var set: Set
}

struct Workout {
    var straightSets: [StraightSet]
}

struct Cycle {
    var workouts: [Workout]
}

let squat = Exercise(name: "Squat")
let bench = Exercise(name: "Bench Press")
let press = Exercise(name: "Press")
let deadlift = Exercise(name: "Deadlift")
let powerclean = Exercise(name: "Powerclean")

func fiveByFive (exercise: Exercise) -> StraightSet {
    return StraightSet(sets: 5, set: Set(reps: 5, exercise: exercise))
}

let dayA = Workout(straightSets: [squat, bench, deadlift].map(fiveByFive))
let dayB = Workout(straightSets: [squat, press, powerclean].map(fiveByFive))

let startingStrength = Cycle(workouts: [dayA, dayB])

extension Exercise: Hashable, Equatable {
    var hashValue: Int { return name.hashValue }
}

func ==(lhs: Exercise, rhs: Exercise) -> Bool {
    return lhs.name == rhs.name
}

let maxes: [Exercise: Double] = [squat: 145, bench: 70, press: 55, deadlift: 150, powerclean: 60]

func workoutForIndex() {
    
}