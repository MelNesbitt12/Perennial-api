const mongoose = require('mongoose')

const renewalSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true
  },
  type: {
    type: String,
    required: true
  },
  date: {
    type: Date,
    required: true
  },
  cost: {
    type: Number,
    required: true
  },
  url: {
    type: String,
    required: true
  },
  instructions: {
    type: String,
    required: true
  },
  owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toObject: { virtuals: true },
  toJson: { virtuals: true }
})

renewalSchema.virtual('needsRenew').get(function () {
  const todayMilliseconds = Date.now()
  const renewalDate = this.date.getTime()
  const milliDiff = renewalDate - todayMilliseconds
  const dayDiff = Math.floor(milliDiff / (1000 * 3600 * 24))
  return dayDiff
})

module.exports = mongoose.model('Renewal', renewalSchema)
