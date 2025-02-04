﻿namespace FriendsOfPesho
{
    using System;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Using Dijsktra Algorithm without priority queue
    /// </summary>
    /// <see cref="https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm"/>
    /// <seealso cref="http://bgcoder.com/Contests/118/Telerik-Algo-Academy-March-2012"/>
    public class StartUp
    {
        private static IList<KeyValuePair<int, int>>[] graph;
        private static HashSet<int> hospitalIds;
        private static int minimalDistance = int.MaxValue;

        public static void Main()
        {
            #if DEBUG
            Console.SetIn(new System.IO.StreamReader("../../input.txt"));
            #endif

            var parameters = Console.ReadLine().Split(' ').Select(int.Parse).ToArray();
            hospitalIds = new HashSet<int>(Console.ReadLine().Split(' ').Select(a => int.Parse(a) - 1));

            graph = Enumerable.Range(0, parameters[0])
                              .Select(i => new List<KeyValuePair<int, int>>())
                              .ToArray();

            for (int i = 0; i < parameters[1]; i++)
            {
                var nodesInfo = Console.ReadLine().Split(' ').Select(a => int.Parse(a) - 1).ToArray();
                graph[nodesInfo[0]].Add(new KeyValuePair<int, int>(nodesInfo[1], nodesInfo[2] + 1));
                graph[nodesInfo[1]].Add(new KeyValuePair<int, int>(nodesInfo[0], nodesInfo[2] + 1));
            }

            FindMinimalDistance();
            Console.WriteLine("The minimal distance is {0}", minimalDistance);
        }

        private static void FindMinimalDistance()
        {
            foreach (var hospital in hospitalIds)
            {
                var dijkstraDistances = FindMinimalDistanceDijkstra(hospital);
                var distance = dijkstraDistances.Where((a, b) => !hospitalIds.Contains(b)).Sum();
                minimalDistance = Math.Min(minimalDistance, distance);
            }
        }
        
        private static int[] FindMinimalDistanceDijkstra(int sourceId)
        {
            var queue = new Queue<KeyValuePair<int, int>>();
            queue.Enqueue(new KeyValuePair<int, int>(sourceId, 0));

            var dijkstraDistances = Enumerable.Repeat(int.MaxValue, graph.Length).ToArray();
            dijkstraDistances[sourceId] = 0;

            while (queue.Count != 0)
            {
                var currentNode = queue.Dequeue();
                foreach (var neighbour in graph[currentNode.Key])
                {
                    int currentDistance = dijkstraDistances[currentNode.Key] + neighbour.Value;
                    if (currentDistance < dijkstraDistances[neighbour.Key])
                    {
                        dijkstraDistances[neighbour.Key] = currentDistance;
                        queue.Enqueue(new KeyValuePair<int, int>(neighbour.Key, currentDistance));
                    }
                }
            }

            return dijkstraDistances;
        }
    }
}
