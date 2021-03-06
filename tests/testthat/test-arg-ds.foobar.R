#-------------------------------------------------------------------------------
# Copyright (c) 2019-2020 University of Newcastle upon Tyne. All rights reserved.
#
# This program and the accompanying materials
# are made available under the terms of the GNU Public License v3.0.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#-------------------------------------------------------------------------------

#
# Set up
#

context("ds.foobar::arg::setup")

connect.studies.dataset.cnsim(list("LAB_TSC"))

test_that("setup", {
    ds_expect_variables(c("D"))
})

#
# Tests
#

context("ds.foobar::arg::aggregate")
test_that("NULL connections", {
    calltext <- call("fooBarDS")
    expect_error(datashield.aggregate(conns=NULL, expr=calltext), "trying to get slot \"name\" from an object of a basic class (\"NULL\") with no slots", fixed=TRUE)

    errs <- datashield.errors()
    expect_length(errs, 0)
})

context("ds.foobar::arg::aggregate")
test_that("NULL expr", {
    calltext <- call("fooBarDS")
    expect_error(datashield.aggregate(conns=ds.test_env$connections, expr=NULL), "There are some DataSHIELD errors, list them with datashield.errors()", fixed=TRUE)

    errs <- datashield.errors()
    expect_length(errs, 3)
    expect_length(errs$sim1, 1)
    expect_equal(errs$sim1, "Invalid expression type: 'NULL'. Expected a call or character vector.", fixed=TRUE)
    expect_length(errs$sim2, 1)
    expect_equal(errs$sim2, "Invalid expression type: 'NULL'. Expected a call or character vector.", fixed=TRUE)
    expect_length(errs$sim3, 1)
    expect_equal(errs$sim3, "Invalid expression type: 'NULL'. Expected a call or character vector.", fixed=TRUE)
})

context("ds.foobar::arg::aggregate")
test_that("non existent aggregate foobarDS", {
    calltext <- call("fooBarDS")
    expect_error(datashield.aggregate(conns=ds.test_env$connections, expr=calltext))

    errs <- datashield.errors()
    expect_length(errs, 3)
    expect_length(errs$sim1, 1)
    expect_equal(errs$sim1, "Command 'fooBarDS()' failed on 'sim1': No such DataSHIELD 'AGGREGATE' method with name: fooBarDS", fixed=TRUE)
    expect_length(errs$sim2, 1)
    expect_equal(errs$sim2, "Command 'fooBarDS()' failed on 'sim2': No such DataSHIELD 'AGGREGATE' method with name: fooBarDS", fixed=TRUE)
    expect_length(errs$sim3, 1)
    expect_equal(errs$sim3, "Command 'fooBarDS()' failed on 'sim3': No such DataSHIELD 'AGGREGATE' method with name: fooBarDS", fixed=TRUE)
})

context("ds.foobar::arg::assign")
test_that("NULL connections", {
    calltext <- call("fooBarDS")
    expect_error(datashield.assign(conns=NULL, symbol="new_obj", value=calltext), "trying to get slot \"name\" from an object of a basic class (\"NULL\") with no slots", fixed=TRUE)

    errs <- datashield.errors()
    expect_length(errs, 0)
})

#context("ds.foobar::arg::assign")
#test_that("NULL symbol", {
#    calltext <- call("fooBarDS")
#    res <- datashield.assign(conns=ds.test_env$connections, symbol=NULL, value=calltext)
#    expect_true(is.raw(res))
#    expect_length(res, 0)
#})

context("ds.foobar::arg::assign")
test_that("NULL value", {
    calltext <- call("fooBarDS")
    expect_error(datashield.assign(conns=ds.test_env$connections, symbol="new_obj", value=NULL), "Not a valid table name", fixed=TRUE)

    errs <- datashield.errors()
    expect_length(errs, 0)
})

context("ds.foobar::arg::assign")
test_that("non existent assign foobarDS", {
    calltext <- call("fooBarDS")
    expect_error(datashield.assign(conns=ds.test_env$connections, symbol="new_obj", value=calltext))

    errs <- datashield.errors()
    expect_length(errs, 3)
    expect_length(errs$sim1, 1)
    expect_equal(errs$sim1, "Command 'fooBarDS()' failed on 'sim1': No such DataSHIELD 'ASSIGN' method with name: fooBarDS", fixed=TRUE)
    expect_length(errs$sim2, 1)
    expect_equal(errs$sim2, "Command 'fooBarDS()' failed on 'sim2': No such DataSHIELD 'ASSIGN' method with name: fooBarDS", fixed=TRUE)
    expect_length(errs$sim3, 1)
    expect_equal(errs$sim3, "Command 'fooBarDS()' failed on 'sim3': No such DataSHIELD 'ASSIGN' method with name: fooBarDS", fixed=TRUE)
})

#
# Tear down
#

context("ds.foobar::arg::shutdown")

test_that("shutdown", {
    ds_expect_variables(c("D"))
})

disconnect.studies.dataset.cnsim()

context("ds.foobar::arg::done")
