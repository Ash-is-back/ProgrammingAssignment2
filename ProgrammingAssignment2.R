{
  "nbformat": 4,
  "nbformat_minor": 0,
  "metadata": {
    "colab": {
      "provenance": [],
      "authorship_tag": "ABX9TyNGr5ZuQD7ie8EdkouGOpr3",
      "include_colab_link": true
    },
    "kernelspec": {
      "name": "ir",
      "display_name": "R"
    },
    "language_info": {
      "name": "R"
    }
  },
  "cells": [
    {
      "cell_type": "markdown",
      "metadata": {
        "id": "view-in-github",
        "colab_type": "text"
      },
      "source": [
        "<a href=\"https://colab.research.google.com/github/Ash-is-back/ProgrammingAssignment2/blob/master/ProgrammingAssignment2.R\" target=\"_parent\"><img src=\"https://colab.research.google.com/assets/colab-badge.svg\" alt=\"Open In Colab\"/></a>"
      ]
    },
    {
      "cell_type": "code",
      "execution_count": 1,
      "metadata": {
        "id": "yO3WcL34B1i4"
      },
      "outputs": [],
      "source": [
        "## Put comments here that give an overall description of what your\n",
        "## functions do\n",
        "\n",
        "## This function creates a special \"matrix\" object that can cache its inverse.\n",
        "## It takes an optional argument x, which is a matrix.\n",
        "makeCacheMatrix <- function(x = matrix()) {\n",
        "    ## Initialize a variable to store the cached inverse\n",
        "    inv <- NULL\n",
        "\n",
        "    ## Define a function to set the matrix\n",
        "    set <- function(y) {\n",
        "        x <<- y\n",
        "        inv <<- NULL  # Invalidate the cache when the matrix is updated\n",
        "    }\n",
        "\n",
        "    ## Define a function to get the matrix\n",
        "    get <- function() x\n",
        "\n",
        "    ## Define a function to get the cached inverse if available; otherwise, compute it\n",
        "    getInverse <- function() {\n",
        "        if (!is.null(inv)) {\n",
        "            message(\"Getting cached inverse\")\n",
        "            return(inv)\n",
        "        }\n",
        "        message(\"Calculating inverse\")\n",
        "        inv <<- solve(x)\n",
        "        inv\n",
        "    }\n",
        "\n",
        "    ## Return a list of functions\n",
        "    list(set = set,\n",
        "         get = get,\n",
        "         getInverse = getInverse)\n",
        "}\n",
        "\n",
        "## This function computes the inverse of the special \"matrix\" returned by makeCacheMatrix above.\n",
        "## If the inverse has already been calculated (and the matrix has not changed),\n",
        "## then the cachesolve should retrieve the inverse from the cache.\n",
        "\n",
        "cacheSolve <- function(x, ...) {\n",
        "    ## Check if the input is a valid \"matrix\" object created by makeCacheMatrix\n",
        "    if (!is.list(x) || !all(c(\"set\", \"get\", \"getInverse\") %in% names(x))) {\n",
        "        stop(\"Input is not a valid 'matrix' object created by makeCacheMatrix\")\n",
        "    }\n",
        "\n",
        "    ## Get the cached inverse if available; otherwise, compute it\n",
        "    x$getInverse()\n",
        "}"
      ]
    }
  ]
}