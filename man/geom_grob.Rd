% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom-grob.R
\name{geom_grob}
\alias{geom_grob}
\alias{geom_grob_npc}
\title{Inset graphical objects}
\usage{
geom_grob(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  na.rm = FALSE,
  show.legend = FALSE,
  inherit.aes = FALSE
)

geom_grob_npc(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  na.rm = FALSE,
  show.legend = FALSE,
  inherit.aes = FALSE
)
}
\arguments{
\item{mapping}{The aesthetic mapping, usually constructed with
\code{\link[ggplot2]{aes}} or \code{\link[ggplot2]{aes_}}. Only needs
to be set at the layer level if you are overriding the plot defaults.}

\item{data}{A layer specific dataset - only needed if you want to override
the plot defaults.}

\item{stat}{The statistical transformation to use on the data for this layer,
as a string.}

\item{position}{Position adjustment, either as a string, or the result of a
call to a position adjustment function.}

\item{...}{other arguments passed on to \code{\link[ggplot2]{layer}}. This
can include aesthetics whose values you want to set, not map. See
\code{\link[ggplot2]{layer}} for more details.}

\item{na.rm}{If \code{FALSE} (the default), removes missing values with a
warning.  If \code{TRUE} silently removes missing values.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped. \code{FALSE}
never includes, and \code{TRUE} always includes.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics, rather
than combining with them. This is most useful for helper functions that
define both data and aesthetics and shouldn't inherit behaviour from the
default plot specification, e.g. \code{\link[ggplot2]{borders}}.}
}
\description{
\code{geom_grob} and \code{geom_grob_npc} add a Grob as inset to the ggplot
using syntax similar to that of \code{\link[ggplot2]{geom_label}}.In most
respects they behave as any other ggplot geometry: a layer con contain
multiple tables and faceting works as usual.
}
\details{
The "width" and "height" of an inset as for a text element are
  0, so stacking and dodging inset plots will not work by default, and axis
  limits are not automatically expanded to include all inset plots.
  Obviously, insets do have height and width, but they are physical units,
  not data units. The amount of space they occupy on the main plot is not
  constant in data units of the base plot: when you modify scale limits,
  inset plots stay the same size relative to the physical size of the base
  plot.
}
\note{
These geoms work only with tibbles as \code{data}, as they expects a list
  of graphics objects ("grob") to be mapped to the \code{label} aesthetic.
  Aesthetics mappings in the inset plot are independent of those in the base
  plot.

  In the case of \code{geom_grob()}, \code{x} and \code{y} aesthetics
  determine the position of the whole inset grob, similarly to that of a text
  label, justification is interpreted as indicating the position of the grob
  with respect to the $x$ and $y$ coordinates in the data, and \code{angle}
  is used to rotate the plot as a whole.

  In the case of \code{geom_grob_npc()}, \code{npcx} and \code{npcy} aesthetics
  determine the position of the whole inset plot, similarly to that of a text
  label, justification is interpreted as indicating the position of the grob
  with respect to the $x$ and $y$ coordinates in "npc" units, and \code{angle}
  is used to rotate the plot as a whole.

  \strong{\code{annotate()} cannot be used with \code{geom = "grob"}}. Use
  \code{\link[ggplot2]{annotation_custom}} directly when adding inset plots
  as annotations.
}
\section{Alignment}{
 You can modify table alignment with the \code{vjust} and
  \code{hjust} aesthetics. These can either be a number between 0
  (right/bottom) and 1 (top/left) or a character ("left", "middle", "right",
  "bottom", "center", "top").
}

\section{Inset size}{
 You can modify inset plot size with the \code{vp.width}
  and \code{vp.height} aesthetics. These can be a number between 0 (smallest
  posisble inset) and 1 (whole plotting area width or height). The default
  value for for both of these aesthetics is 1/3.
}

\examples{
library(tibble)
df <- tibble(x = 2, y = 15, grob = list(grid::circleGrob(r = 0.2)))
ggplot(data = mtcars, aes(wt, mpg)) +
  geom_point(aes(colour = factor(cyl))) +
  geom_grob(data = df, aes(x, y, label = grob))

}
\references{
The idea of implementing a \code{geom_custom()} for grobs has
  been discussed as an issue at
  \url{https://github.com/tidyverse/ggplot2/issues/1399}.
}
\seealso{
Other geometries for adding insets to ggplots: 
\code{\link{geom_plot}()},
\code{\link{geom_table}()},
\code{\link{ttheme_gtdefault}()}
}
\concept{geometries for adding insets to ggplots}
