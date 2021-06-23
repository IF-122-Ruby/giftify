import { Application } from "stimulus"
import  Rails   from "@rails/ujs"
import { definitionsFromContext} from "stimulus/webpack-helpers"


const application = Application.start(document.documentElement)
const context = require.context('.', true, /_controller\.js$/)
application.load(definitionsFromContext(context))
